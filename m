Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SqkaS-0000T0-GQ
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 14:39:40 +0200
Received: by vbbfr13 with SMTP id fr13so3447483vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=x3wjNhguRVPLeD76Ff3IwxamHr5oY0ZJhjKzKpxCw3A=;
	b=Jt31XAqYb/hIqCiPUuJ1qWyS7CShIDdVjQ3sF20xASnvT4gA3yuvC0+28T0UxJkanm
	/XxWufvgmakIcc5yCSbS6QfL2PNmm2wTwyTL5HJ7DpzRYrbsAvEoWG1fn5AW8Mt+eGhx
	I6B28YAP4XS4pMXh7QQ5tAWdHJM2G3JzSa0RWbsEuIL/Gceb/oQ/HOIVCOVa8/w80zCx
	ZCmxjnL/Zk1pk8Uivyy6CBKthrPIx8sEr+g5YPklfbCSovJpYhku0yuEEBOK06ftEug9
	5O4/ySeCTPq6bu+Xxd5KFznR1BKrO/CF4BTTIwMjEQtO7jySgWK4Tcspuewt25qRH61x
	bPfA==
MIME-Version: 1.0
Received: by 10.220.221.7 with SMTP id ia7mr5237908vcb.31.1342441701918; Mon,
	16 Jul 2012 05:28:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.220.196 with HTTP; Mon, 16 Jul 2012 05:28:21 -0700 (PDT)
In-Reply-To: <29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
	<29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
Date: Mon, 16 Jul 2012 09:28:21 -0300
X-Google-Sender-Auth: PE9-EQkjBkxt7K6oPQaPDRQzIEU
Message-ID: <CAP9ODKrBnzOM7rfhRr5KC-L_EjuwZ73NkpHcyg1hiOxKXD+6Rg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Mon, 16 Jul 2012 12:39:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 16, 2012 at 3:11 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 15 jul. 2012, om 23:25 heeft Otavio Salvador het volgende geschreven:
>
>> On Sat, Jul 14, 2012 at 6:59 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> The recipe is autotools based now, the COPYING file was replaced with the complete GPLv2 license text.
>>> No more 'lspci' needed ad runtime, but zlib and libnl are needed nowadays.
>>> Add 2 patches, one to fix cross builds and one from Linaro to fix C state parsing on !x86.
>>
>> Please add proper Upstream-Status for the patches; it is nice to have
>> those to track the pending patches.
>
> Isn't that field only used to put in "pending" and then backslap each other on doing such a good job?

From what I read, those are backports; so you can use Backport
[applied in version X.Y]

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


