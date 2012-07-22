Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1St18J-0005yH-Rz
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 20:43:59 +0200
Received: by vcbfy27 with SMTP id fy27so4068834vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=JLuJhuz678Gsf12FOxXYu74oazHuD6VMJgzkmH4qn5A=;
	b=H3DXetzeC1EjSZ5ZDkjpRKoi7Y6fuVi+uL8ubnhfaagE6x7HwUkvqSzuV07hIO7DEe
	WD7PypdGq+uCrvDc+WzXN8Aobvbh62uon+BpCbK5mZFegcQWrS1iFG8hIp1aTTYOdHVz
	A9Jtcq69T870P781cBc1pDc9c1VuhYUiug9SoPq18zrEcqQa68vi1sZoTdtkNpgjZgNu
	cue5oJtPSVVgu/5IM44NaUCchPhC7pz57Z10bSglR2ltX3lqiB6ylGxVYLz8lPz0xgeX
	i18Tuw5c4CBFPNYcx2FzQKsTXnakyfASWvpB3TNc5iwOOaO5Rw/cwDquBjV2YttqeK1b
	hBxA==
MIME-Version: 1.0
Received: by 10.220.220.132 with SMTP id hy4mr10160528vcb.33.1342981953150;
	Sun, 22 Jul 2012 11:32:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.220.196 with HTTP; Sun, 22 Jul 2012 11:32:33 -0700 (PDT)
In-Reply-To: <1342959527.21788.76.camel@ted>
References: <1342808031-21564-1-git-send-email-otavio@ossystems.com.br>
	<1342808031-21564-2-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKq0_7mjdG-g6QMTeqjJcgrud6TeFcmkeGAwRr-cY1vhqA@mail.gmail.com>
	<1342959527.21788.76.camel@ted>
Date: Sun, 22 Jul 2012 15:32:33 -0300
X-Google-Sender-Auth: rQjGaZQLgjvM3-tXXniXOGryqAM
Message-ID: <CAP9ODKp+-p07qG1o4iMB2y1Hm-a1w9ZFW2xEQEX6ui1uq2o6kQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] shadow: use 'users' group by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Jul 2012 18:44:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 22, 2012 at 9:18 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-07-20 at 15:16 -0300, Otavio Salvador wrote:
>> On Fri, Jul 20, 2012 at 3:13 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> This would be nice to have included in next denzil.
>
> Reading the one line description of this, I have no idea what the
> problem was or how this solves it. Its therefore unlikely to make it
> into master, let alone denzil. Can you provide more detail please.

The current setting makes useradd to create an user with group 1000 by
default (in Debian, users group) but in Yocto users group is 100 and
there's no 1000 group by default.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


