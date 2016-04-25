Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 93B6A6FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 09:38:53 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id f89so144375578ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 02:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FQ2qbH2JFZI3ZBIrSOv+d1ACliVUdiEp9j3lx+LLu3w=;
	b=dAxUPNNsRw3DypvEZdZZDMJ2iD46Wc386maO4naNxEXhgpHLkLhvb9snxFqmPAahaW
	0yAgniN6cLvwYSRgbILzu690YDHxSxlHaJnbbh/Cc+6vbzYZVGSRIynuMhKz/vycdSyl
	Uj1zlbKwEYnPaTbnNh7HPxw3qgwTbjW7G1IPw/N324s2Vjv9y42DUUSnmwlTuunP/elN
	uc/Rd9SkOrsfxQh964LAdrmBLDfg+GkkRTyy0YVTo4FW8XuBT/Q6kNEW65qMRnsLtMiJ
	ZkZgiHI8XLLvJZvr8SjJLu6UVUUI0CuWgp8IXvoDOVYB+VcnmL8DYLI0YmQyiPWdB7GP
	/gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FQ2qbH2JFZI3ZBIrSOv+d1ACliVUdiEp9j3lx+LLu3w=;
	b=OVVxON6OxKz1GVwPFP1L3sQNAuSOQ89iM3D5fNap/0pSCLtAbmSrAHT+r7qxx//OW9
	QFQ/5vi8qzJM0UKziLZ8ktI+v2jdk+Td226MIcmusFk4uiSozut5Xo1rz/Z+c8PtJ8TU
	lJRQIXcl6uyuMQg8m7EMjIOF8bEWg8g24ZAEiRmc0TQ8YHK2rQmae+hDpON4cWyYEL9G
	61cRE0h4fc7So4J6+lRlHtMhp3k33vawhcLcB4RQNElWv/4JjPUn2I0sUmj6cQctUftz
	Kjoe9bhqTqhg/6p8O3GFgoatL/4B18vgYMmr8J8UVLVSbIv7Gais6liK4NXqX0Cx93n9
	nvTA==
X-Gm-Message-State: AOPr4FV23KNB5U9Fs9uch8M7jrafbpNyC3aBCORkGWzsrHNcwfZv8JyUP1QivHNdyOpRqPWh58duYoirVTrH+s9L
X-Received: by 10.107.179.136 with SMTP id c130mr21814446iof.99.1461577134006; 
	Mon, 25 Apr 2016 02:38:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Mon, 25 Apr 2016 02:38:34 -0700 (PDT)
In-Reply-To: <571DE3CD.6010803@opendreambox.org>
References: <1461569133-13241-1-git-send-email-obi@opendreambox.org>
	<CAJTo0La317pVNc9NLZTc3coUS94v40SBND00RbC-aa7mtex5dw@mail.gmail.com>
	<571DE3CD.6010803@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Apr 2016 10:38:34 +0100
Message-ID: <CAJTo0LZno2L+-F413uBGy7H8eQrV6Fia4EPpHXihbj=ju5sh7A@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: explicitly disable tomcrypt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2016 09:38:53 -0000
Content-Type: multipart/alternative; boundary=001a1148578ce277cf05314bf1b7

--001a1148578ce277cf05314bf1b7
Content-Type: text/plain; charset=UTF-8

On 25 April 2016 at 10:30, Andreas Oberritter <obi@opendreambox.org> wrote:

> Oh, I didn't notice. Note that the other patch doesn't add the necessary
> dependencies, so enabling tomcrypt won't work. And it would be nice to
> include the user-visible error message in the commit log.
>

The missing dependencies is a good point, patches swapped :)

Ross

--001a1148578ce277cf05314bf1b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 April 2016 at 10:30, Andreas Oberritter <span dir=3D"ltr">&lt;<a href=
=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":tl" class=
=3D"a3s aXjCH">Oh, I didn&#39;t notice. Note that the other patch doesn&#39=
;t add the necessary<br>
dependencies, so enabling tomcrypt won&#39;t work. And it would be nice to<=
br>
include the user-visible error message in the commit log.<br></div></blockq=
uote></div><br>The missing dependencies is a good point, patches swapped :)=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a1148578ce277cf05314bf1b7--
