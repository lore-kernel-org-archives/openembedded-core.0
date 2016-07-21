Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 239AB605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:50:42 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id f6so27961145ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 12:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zdk36EWUCSzbMqQTJLvNEL3k5QopqaB4p5GG0jKXvBA=;
	b=L8PrsMcjvdFoMFibOqI49tMEIy3hJQ0NB4U3Pzqfb6EBHPoamKQyvCo28EzCS6MKHm
	6uOfh2tEbyvcIw6MIWG70JWR65SCZCNEJj/Qq9ZniIVs7sn9QEgUwEyMsfEGbToxeZHP
	75O7jF9UOW/T+RTUZFIT+s9vC9MQS7Gi1816CnieYhpwMagInHcNFQ5uJlfbz1tcO14y
	SqaUaqtOySzHnU2U/o8fq+eG6qYa0hox8r+wxZKh5JkyHZOdYze0eiR/9Adv1jbK2Q5W
	jDg6uhnvY4SmZfQdStpZCq7jb4xyLlcRcqIey4o/b5PCctflpXYUk8jWw507IMeezRQV
	vlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zdk36EWUCSzbMqQTJLvNEL3k5QopqaB4p5GG0jKXvBA=;
	b=W76Lj+yTCg6i712bsbAXpWAXGeJjdaYih2Jq3ebvKt/kFgtHFFwdNm64LpOA0Je1ws
	tXM1OJmmnekNjlzkfGLcHEY6HzU/8zinAHjnRYc70erEg75v07tD3gAuKf46ihx8C/we
	uVcScExk9rk23R7XlwZScCUrq424ToOgKXirjo98Hcf9MxiLwlPCfIoZWc7ToPgYbfGk
	N6hpfcCnKA82Zxhf8dv/LRMd3uRxLp2TjzutfgP06/lKryt74ofRH3egjYMqEKAw8G+X
	0ZnMlFDP6yUXT4uv/JOjeGyg5S97cg56Qu9tGCadTMHWq/Y0AInWOihzZQXoeBDfjM90
	4QGg==
X-Gm-Message-State: AEkoousOhM0C6hACy7ncNtnRmD+nKMYifEbfUk+7VqAgrBzrhahsGXDN42JYcydEEmM4BKjHgWx0nWXI8JKEhcGy
X-Received: by 10.36.57.211 with SMTP id l202mr87586ita.22.1469130642199; Thu,
	21 Jul 2016 12:50:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 21 Jul 2016 12:50:22 -0700 (PDT)
In-Reply-To: <CAKRNOGzXLf_kfousHniKin-qqs2TURwOQQptDJTMHA9Gqe5now@mail.gmail.com>
References: <CAKRNOGzXLf_kfousHniKin-qqs2TURwOQQptDJTMHA9Gqe5now@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jul 2016 20:50:22 +0100
Message-ID: <CAJTo0La7u+Zi2Yo7dcpm4X9q=j=RHuL93V_B6w4wRJbQV4tSXg@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro] rootfs: Modify RPM installation
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
X-List-Received-Date: Thu, 21 Jul 2016 19:50:44 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca0e9e7005382aa2dc

--001a114ab3ca0e9e7005382aa2dc
Content-Type: text/plain; charset=UTF-8

On 8 July 2016 at 08:57, David Vincent <freesilicon@gmail.com> wrote:

> When using a custom RPM data directory instead of the default dir
> '/var/lib/rpm', the final image did not contain any of the database
> files in the expected location. This commit takes into account the
> 'rpmlibdir' variable set into 'rootfs_rpm.bbclass'.


Can you resend this based on current master please?

Thanks,
Ross

--001a114ab3ca0e9e7005382aa2dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 July 2016 at 08:57, David Vincent <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:freesilicon@gmail.com" target=3D"_blank">freesilicon@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">When using=
 a custom RPM data directory instead of the default dir<br>
&#39;/var/lib/rpm&#39;, the final image did not contain any of the database=
<br>
files in the expected location. This commit takes into account the<br>
&#39;rpmlibdir&#39; variable set into &#39;rootfs_rpm.bbclass&#39;.</span><=
/blockquote></div><br>Can you resend this based on current master please?</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks,=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a114ab3ca0e9e7005382aa2dc--
