Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 31CC276980
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:32:42 +0000 (UTC)
Received: by qgdd90 with SMTP id d90so46268992qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 12:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qxxvWAGpUw/IIqnK0jFBi1N8l6WrtZef1pauGaTVX5E=;
	b=N4HwHTirigcIK4/ny0u1GbBQV0MTclhB9WGqKNIqYXucsf/qkttxpGFpSRKVGMUG1+
	rqTR5y8tdQTgDdn9pPyzS1ZUpEDOUR4SmJS0TfmuDfinB+0ocYjMymW1qL5LnYzTeQ/J
	NaA3/rarbOeqig/AAZgfara661RgIk/+mtrgGdJNtfQIdf+71//Q/FZExtzCVNU5mG30
	WETv/GQgCQT0XZqLD6REfGeSIFX0otmPViZ8sCT1o+Qn+Ni9VN2j2SXH0loQP+AGhrLL
	2a5Q+ppeVRLE4MtRE1MSXzU42ajrAXsPU3Il+yXibL55tg+40hJEXdElskjaE5pPGCzF
	R7Gg==
X-Gm-Message-State: ALoCoQkTfWPtdQNVihY1aQQZmDwv36P0bo4+ZMSeJE3nQNhctapwugpVjr++7Cg2QajTOxH7W4Am
X-Received: by 10.141.28.200 with SMTP id f191mr54543350qhe.52.1439321562403; 
	Tue, 11 Aug 2015 12:32:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 12:32:23 -0700 (PDT)
In-Reply-To: <bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
	<bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 20:32:23 +0100
Message-ID: <CAJTo0LZPwjPuxgnnjvAyqhBWoK8JWJdMOO2G6MGGgj1An6FxUg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] screen: Add version 4.3.1
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
X-List-Received-Date: Tue, 11 Aug 2015 19:32:45 -0000
Content-Type: multipart/alternative; boundary=001a1142341271f811051d0e2a42

--001a1142341271f811051d0e2a42
Content-Type: text/plain; charset=UTF-8

On 10 August 2015 at 13:08, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> * Preserve the old 4.0.3 version (GPLv2+) and add new 4.3.1 (GPLv3+)

Is screen considered sufficiently core that we should maintain both GPLv2
and v3 recipes?  I'm not convinced it is.

> * Remove unused debian patch from SRC_URI of 4.0.3, increase PR

No need to increase PR.

Ross

--001a1142341271f811051d0e2a42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 10 August 2015 at 13:08, Jussi Kukkonen &lt;<a href=3D"=
mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<br=
>&gt;=C2=A0<span style=3D"font-size:13px">* Preserve the old 4.0.3 version =
(GPLv2+) and add new 4.3.1 (GPLv3+)</span><br style=3D"font-size:13px"><br>=
Is screen considered sufficiently core that we should maintain both GPLv2 a=
nd v3 recipes?=C2=A0 I&#39;m not convinced it is.<div><br><div><div>&gt; * =
Remove unused debian patch from SRC_URI of 4.0.3, increase PR<br><br>No nee=
d to increase PR.<br><br>Ross</div></div></div></div>

--001a1142341271f811051d0e2a42--
