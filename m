Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 38D8560144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 12:30:51 +0000 (UTC)
Received: by qcvs11 with SMTP id s11so2091849qcv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 04:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9ywrDSrLQAKvzCVCPAcDKuoltXL2NIQqnIZklUVN9+8=;
	b=gaQuO766yrOxBnsk/JornKII29I2TtzczFYrWWxqDF+TJmiAsF5yYhE6IjvUPRmR1Q
	FyvPPR78tVy6o6QDtuaEY1Vj9KgVYUkM4S+PC4A0xyydQbKde9MIOrYHbySygOfdEqa6
	mK5lAGa2lX9o82kHT5t2YojLvK5qfbGqLLdhDv7a3+4zhVyYQXXf7yhPp6HKrc4EjdK+
	6eWYMb9dXnykMzlc+poRz5rC0HLGGqwpG2dK8KKKZh4y9n7uSv14ht2IGWPCjsiavXMu
	G25ruf92csFIeLX1iN1rSnWbh4veeZ7EVw9iJOFA9+4B5sLGMKLOZI3h3luGzrIm+0u9
	e4zg==
X-Gm-Message-State: ALoCoQlb0hIAiLmdahVtpinOjsW12C53ENNBz3RzV8dyZ+1VM6xWalab8RjscmEikrHZEiyh+LWk
X-Received: by 10.55.20.143 with SMTP id 15mr6820517qku.36.1425472252558; Wed,
	04 Mar 2015 04:30:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 4 Mar 2015 04:30:32 -0800 (PST)
In-Reply-To: <1425418365-16648-3-git-send-email-rob.woolley@windriver.com>
References: <1425418365-16648-1-git-send-email-rob.woolley@windriver.com>
	<1425418365-16648-3-git-send-email-rob.woolley@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Mar 2015 12:30:32 +0000
Message-ID: <CAJTo0LaZ92AKahsVriO02mAO3czZi6BTA+JyxwCGbV5ja5L=8A@mail.gmail.com>
To: Rob Woolley <rob.woolley@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] logrotate: Identify CONFFILES
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
X-List-Received-Date: Wed, 04 Mar 2015 12:30:53 -0000
Content-Type: multipart/alternative; boundary=001a114001384055cd0510759f4e

--001a114001384055cd0510759f4e
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 21:32, Rob Woolley <rob.woolley@windriver.com> wrote:

> +CONFFILES_${PN} += "/var/lib/logrotate.status /etc/logrotate.conf"
>

${localstatedir} and ${sysconfdir}, please.

Ross

--001a114001384055cd0510759f4e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 March 2015 at 21:32, Rob Woolley <span dir=3D"ltr">&lt;<a href=3D"mail=
to:rob.woolley@windriver.com" target=3D"_blank">rob.woolley@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1fa" cla=
ss=3D"a3s" style=3D"overflow:hidden">+CONFFILES_${PN} +=3D &quot;/var/lib/l=
ogrotate.status /etc/logrotate.conf&quot;<br></div></blockquote></div><br>$=
{localstatedir} and ${sysconfdir}, please.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114001384055cd0510759f4e--
