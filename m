Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5850475E2D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 08:56:19 +0000 (UTC)
Received: by qgec40 with SMTP id c40so365798qge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 00:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=v+fGKW0Ap1/HfqkTDAGuYdz660N8v+YqRVfTK0fQ4CA=;
	b=ZVhREpgcPGErPf5Lak5ZhpLev1F/x+ZHJzskObl2Fb0Gc3HieL3N5G/+T0l/1IoxRL
	8SebFfiJx7oWX49AV/lOX1yy5jBy+SgQh0dh8Ew/P8rpEtT1OXEXILEgo4Nfn1AQuho2
	O5RZYKXBoA5sW9ohde9S4TxRxvqnJFnMRDPJkDpUe34dzBd9hbHfVjfjqJmJbmPPxgWB
	AgxarxdyPzTnBFxDxd2nWVcfaqnhnP2vaJdOz1Ty1hyf38xPDSbPGB5+MmqiP4+w3bYg
	7GWDsQvOYlU2+FRAYHEHnxKbleBZjxodjlVtQGB6OMZljZsVDdl/lCM/fQmjjo2/MtGA
	r1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v+fGKW0Ap1/HfqkTDAGuYdz660N8v+YqRVfTK0fQ4CA=;
	b=SWZAUqlfe6/B+vousHmyqaNYuAf/rGyt8Q0Oo0nZ9IjTrclthAApR6veCphEBJJeEd
	9SylfP0jj06RVih4FKsjyIM3m1bHSqMK8NQN9ThRKPOVovFkQi/rUsuTKXI2uEBKngEh
	sqNSBQA7zls7naoAjA88D0EAwZE8fkA+BIKFzn7J6KohizqY5pBbH3eeyGJRrbsPSg62
	O0WhhojQkq2J5PR4zrZSoyYbGK96+uQnHqra+LMt4wFbJEtH7So680OWMhL6vuX73InO
	g4kGDO/EDBY7wEl4WPDiDt+uAaCpvP4MSctQmrJTwLa14TH2iLKnBqd6i1TPHzdctFzg
	cvgg==
X-Gm-Message-State: ALoCoQnfCZFNfyACOtx5An6Cy6tdlXPV5BTAtHrMuoENPOH2Z+Noug604EwjiODbETaLqB8SxKWS
X-Received: by 10.140.171.197 with SMTP id r188mr6630676qhr.93.1446713779828; 
	Thu, 05 Nov 2015 00:56:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 5 Nov 2015 00:56:00 -0800 (PST)
In-Reply-To: <563AB0D2.4000305@windriver.com>
References: <cover.1446623061.git.mariano.lopez@linux.intel.com>
	<563AB0D2.4000305@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Nov 2015 08:56:00 +0000
Message-ID: <CAJTo0LZAOCRdF0XPuOw0JDZ5J2L-FzbcXSOnERt8WcZ=pYLDpQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Delete WORKDIR/installed_pkgs.txt after use
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
X-List-Received-Date: Thu, 05 Nov 2015 08:56:21 -0000
Content-Type: multipart/alternative; boundary=001a113a7dfaf04ebf0523c74c68

--001a113a7dfaf04ebf0523c74c68
Content-Type: text/plain; charset=UTF-8

On 5 November 2015 at 01:28, Robert Yang <liezhi.yang@windriver.com> wrote:

> The installed_pkgs.txt is very useful as a reference when we want to know
> which pkgs are installed, there is no other easy way to know.
>

There's a manifest in the deploy directory which has the advantage of being
correct.

Ross

--001a113a7dfaf04ebf0523c74c68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2015 at 01:28, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":30" c=
lass=3D"a3s" style=3D"overflow:hidden">The installed_pkgs.txt is very usefu=
l as a reference when we want to know<br>
which pkgs are installed, there is no other easy way to know.</div></blockq=
uote><div><br></div><div>There&#39;s a manifest in the deploy directory whi=
ch has the advantage of being correct.</div><div><br></div><div>Ross=C2=A0<=
/div></div></div></div>

--001a113a7dfaf04ebf0523c74c68--
