Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UbWah-0003bG-TQ
	for openembedded-core@lists.openembedded.org;
	Sun, 12 May 2013 15:45:35 +0200
Received: by mail-oa0-f48.google.com with SMTP id i4so6448854oah.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=w1bk1Bcv84EzI+Ra0Ct+N4kQiy4w5JX5OWAAsEMxFVs=;
	b=JUODFWdgRpO011cPXzVvRBmN1AVQGKzttB+5BNXVJ2dxVM+sYYIMFC7wbqYZNcu4ox
	MxMvlxZ6y12vkfYUuoPhFM+FihNbJ724t7REC6cgxCjOX4prlIJfD7DO7dSIZ8/D9A5g
	n5YR5utTqS0+Ulm/neBgQrAqJJ+wU1Hms3tF3nINBjy6bd/bSQRU6I56yVnCZ/wQ8jNr
	V/wYQqCBFAt+sksA5Hrd485nmbk/qzgnewrPG81obfklTeMaz2+fxkBHQBj87+ptHgo8
	u9fh+GmVISJ/8rxaCO6QZYU6802yUfFf9dLczgJRcKPzyb0VY6SgigM1MS7x9KDHOBZC
	HMfQ==
MIME-Version: 1.0
X-Received: by 10.60.133.240 with SMTP id pf16mr5201270oeb.28.1368365242696;
	Sun, 12 May 2013 06:27:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Sun, 12 May 2013 06:27:22 -0700 (PDT)
In-Reply-To: <518E4EAB.8050502@balister.org>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518D7326.1030901@linux.intel.com> <518E4EAB.8050502@balister.org>
Date: Sun, 12 May 2013 10:27:22 -0300
X-Google-Sender-Auth: e8Yf2WRlCtUxim-OimDIU1LP17U
Message-ID: <CAP9ODKoB_KzEPvRwDkZxLgq4d5A5DiPZ+gfko5XgF3qp9fP_xQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Philip Balister <philip@balister.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 May 2013 13:45:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, May 11, 2013 at 10:59 AM, Philip Balister <philip@balister.org> wrote:
> On 05/10/2013 06:22 PM, Saul Wold wrote:
>> On 05/10/2013 05:33 AM, Jukka Rissanen wrote:
>>> The VPN support is activated if DISTRO_FEATURES contains
>>> vpn string.
>>>
>>
>> This also create a dependency on the meta-openembedded layer, I am not
>> sure we want to do that.
>
> If the default setting does not add the dependency it should be OK? What
> packages in meta-oe are needed? Does this suggest they should move to
> oe-core?

I think so, it'd be good to have it in oe-core and allow use of vpn :)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


