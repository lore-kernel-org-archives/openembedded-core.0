Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id F10DF73905
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 20:37:08 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so149052491qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 13:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ks+F4Sh/KfW1HS2Upj4GNc2meKRTkYQD8X27Su3VoLs=;
	b=KairjfGkEUzfvdwaQTtav1T36+fuBXeQJrgwmzDFiFu1nnUj9yG4yRdKIjQbvVijHD
	Yb1+Z9mNayA9uhZkLffNdBTCtRUg/anm5QtgA+gR5YRGKf/0lcfIVTqIKJku0AiTYCZc
	xP8v/UJD6M6d5TWlANOgW2xtTLbd+DSWlaPYL92BfOcjHz6dITx8ZfYR0QMe6cQigaU/
	CtptE/PQpbiLfUAp3+fP4itw0Y76KlRhgOwT4Z8X4YTMNlWpmdXG63iReuv0gVqY1rXr
	G23ceDfNd/jpZn9fZRqFJPWN3yVw2fih74kSVuDpc9K9sRVu/k9WWhLWyH3lRv2NMDPk
	4XiA==
X-Gm-Message-State: ALoCoQlqxzxyD9Mc0nm//sTT22B2TC8gadMs8FE5W9vuNfWgPtSc3xqcD2b5bV4lk8E2bIxKHfBq
X-Received: by 10.140.196.129 with SMTP id r123mr10710542qha.93.1436301428866; 
	Tue, 07 Jul 2015 13:37:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 7 Jul 2015 13:36:49 -0700 (PDT)
In-Reply-To: <CAJTo0LboyrFCD25jeEXzM4+J0BehC8XwJW2a0rOvyXKAqMQhUg@mail.gmail.com>
References: <1435231444-30705-1-git-send-email-thomas.perrot@tupi.fr>
	<CAJTo0LZXnV=-PWRhekYvkqgPkjy1pit_zMxGXErUs77eC5NNMg@mail.gmail.com>
	<CAGXeWgk2Cn-487Vw0UrYy+3Ti0ShtJZgc3P732hq3yJCdhYydw@mail.gmail.com>
	<CAJTo0LboyrFCD25jeEXzM4+J0BehC8XwJW2a0rOvyXKAqMQhUg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Jul 2015 21:36:49 +0100
Message-ID: <CAJTo0LazGKAzYqTPXhfrj54kVrmMBqvwFVrHp=SxgfknGvMbGA@mail.gmail.com>
To: Thomas PERROT <thomas.perrot@tupi.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Set S to fix QA warning on systemd-serialgetty.
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
X-List-Received-Date: Tue, 07 Jul 2015 20:37:14 -0000
Content-Type: multipart/alternative; boundary=001a11433952755899051a4efca1

--001a11433952755899051a4efca1
Content-Type: text/plain; charset=UTF-8

On 26 June 2015 at 16:35, Burton, Ross <ross.burton@intel.com> wrote:
> So a good question is why don't I see that warning?  :)

So this was bugging me and Richard was also concerned about why neither of
us saw it, nor the autobuilder.

Turns out to be an old default behaviour (#4634) triggered by having
buildhistory enabled.  Suffice to say this patch is unblocked now and
should be merged soon now it's understood: it was obviously right but the
lack of the warning triggering was worrying.

Ross

--001a11433952755899051a4efca1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 26 June 2015 at 16:35, Burton, Ross &lt;<a href=3D"mail=
to:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>&gt; So a=
 good question is why don&#39;t I see that warning? =C2=A0:)<div><br></div>=
<div>So this was bugging me and Richard was also concerned about why neithe=
r of us saw it, nor the autobuilder.</div><div><br></div><div>Turns out to =
be an old default behaviour (#4634) triggered by having buildhistory enable=
d.=C2=A0 Suffice to say this patch is unblocked now and should be merged so=
on now it&#39;s understood: it was obviously right but the lack of the warn=
ing triggering was worrying.</div><div><br></div><div>Ross</div></div>

--001a11433952755899051a4efca1--
