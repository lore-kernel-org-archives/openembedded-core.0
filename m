Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 77AC4713E4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 18:09:39 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id m20so12629528qcx.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RFZx8HYsPMGy/zsTNboX1LZS8wvVlfHgIddUPgWcY6s=;
	b=OJZ4+BRY05e2hHKvDM1H9d8+m7YjflOri3j9BySPLVDuXR05250k0YABYzq3x+74y/
	2t5GVhAvBBVVvCZBbtNiT6Df2G7asTPAy/WN60iy4dkOF3VuR1OqsN7U8G/jJoEZvAk9
	uj23qAxYN/wFZRrBBkl+YebikPsMHbW4FxzR0i/isz3/5qxJq/WUUCNxrbLW1AuyWFld
	dfTTM/Ig2olKd88EkI/5QcmChZ49uE+AkuOfoCok2UBwAGOqQH6KCBMJSORhqm37NOmc
	QyPXkeMAy2CrG5KtqxmRVaxJs8u1WoGeQgwemNWXpsDK7ImqT/DW8SUxTHgugKj7rS93
	yZ5w==
MIME-Version: 1.0
X-Received: by 10.224.15.201 with SMTP id l9mr21140761qaa.27.1409940580368;
	Fri, 05 Sep 2014 11:09:40 -0700 (PDT)
Received: by 10.96.147.37 with HTTP; Fri, 5 Sep 2014 11:09:40 -0700 (PDT)
Received: by 10.96.147.37 with HTTP; Fri, 5 Sep 2014 11:09:40 -0700 (PDT)
In-Reply-To: <CAJTo0LbQtJFH8Tm3y58WPVx3GGbzCPATrqt5OnNWT3Q1=q1ALA@mail.gmail.com>
References: <CACS+7ZQq_tHp0vA0FA8e1W+iLhuzEA3tov0B5QGFaUvGp_cgNg@mail.gmail.com>
	<CAJTo0Lb8TdnZqDObaNS5JQROLYF9MG-67+W5i=kFBF8TE+s8-Q@mail.gmail.com>
	<CACS+7ZQiCVksBN1FK9wJ56k_hpJhpYFq23sWw3srHQ5ZsE1P9A@mail.gmail.com>
	<CAJTo0LZNo4MxuZoSOvZU-kaL1v=+Wyy2To=s8Dp68ShszTRSbQ@mail.gmail.com>
	<5409D739.1030307@windriver.com>
	<CAJTo0LbQtJFH8Tm3y58WPVx3GGbzCPATrqt5OnNWT3Q1=q1ALA@mail.gmail.com>
Date: Fri, 5 Sep 2014 12:09:40 -0600
Message-ID: <CACS+7ZRpzVyKyngYSo-GpyCZu1iM5saphZ=3Fbm7Y_dqD2xu_A@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Fri, 05 Sep 2014 18:09:42 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8c347288fe0502555fb2

--047d7bdc8c347288fe0502555fb2
Content-Type: text/plain; charset=UTF-8

On Sep 5, 2014 9:54 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
> On 5 September 2014 16:31, Mark Hatle <mark.hatle@windriver.com> wrote:
> > I'd prefer a patch that used a define myself.  I don't like seds of
source
> > or patches...
>
> A #define for /root might even get upstream.
>

I hacked up configure to do this. I'll submit it this evening.

> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--047d7bdc8c347288fe0502555fb2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On Sep 5, 2014 9:54 AM, &quot;Burton, Ross&quot; &lt;<a href=
=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 5 September 2014 16:31, Mark Hatle &lt;<a href=3D"mailto:mark.hatle=
@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>
&gt; &gt; I&#39;d prefer a patch that used a define myself.=C2=A0 I don&#39=
;t like seds of source<br>
&gt; &gt; or patches...<br>
&gt;<br>
&gt; A #define for /root might even get upstream.<br>
&gt;</p>
<p dir=3D"ltr">I hacked up configure to do this. I&#39;ll submit it this ev=
ening.</p>
<p dir=3D"ltr">&gt; Ross<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--047d7bdc8c347288fe0502555fb2--
