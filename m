Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 889087546A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 15:19:16 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id t198-v6so10591080ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=WkzYKV522hHgqUXQzrQYKwkdmpYpbPpiYvI7OHuLp28=;
	b=RHCGHQzp5Km0MMOflo2C6ZMyxvOEKO+9CXBL52A0MZra7C5ry3tcN+S27zXw/EKBaW
	ihgiFl1yVSANiHrEvUwxvJYJMziEQ5cfwTCBvmTmVuO4pQQl40SlVr+Pl86jx4EhRbAY
	rC7nyMRlzqfASEdKrnarQ4LcsODSWyP2u8YeaKPuHcAtcsJkuws9OXBdt6e07okz7FXF
	XeEJ/2cqW6+vds1UgieKMIcDB7DR3oxPfCieovKbUUotqTCxh5hTJbZE5a0OOKsHAY9C
	Eywza92O7NgrARSRZmzelRhVdDLLWijrjylWO3mmtbTqw6rl3reGh1wtWPMFVi6oEZUI
	LjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=WkzYKV522hHgqUXQzrQYKwkdmpYpbPpiYvI7OHuLp28=;
	b=iXGuixEkO1XVxjyNOcybl4/mv4rIfJLZ6aA+XvtCIPz+EZW1kNa9hmPWI6/iIjWHne
	eCFXQ1FF8E6h9QtdRhRPagJwu9PKpwZmwa7GXu4jMZkVLFKSyeB0w6keFkBGUeIMhyXg
	QCP8kWkIHPGTaAB4NA8x9fmwh5Nvf/rIC5nik8DZUIzmjuPy9wQgjxZyGJR1pyFQO2zp
	UgBLel17FZ3YMrHrIzzxb3TglCLAjaqFqdVDS2aN82CDTe2qugC4Mu+gs7XDzbW/Et2J
	n2J9ZQ3ZkJfAp+uGVnvphijQUdZl/vP12ONUg1x/vPfmVrSiQL0yjATQpJ6/oGnfba6N
	FSkg==
X-Gm-Message-State: AOUpUlFHqqnbhNcZ1oJXR+wNwVJRxQhr97ZgYs7Rd3lqM3w0A1UjrHfO
	dBDTowYLIgShqMJB1OHTpWkOhrReyCNAPnnwpC8=
X-Google-Smtp-Source: AAOMgpf6nkCfOFwYrTAzSwcvKo6Uu21r/zmGZEW/dUyHqxHWld5w8cOceh2dVohED6KGuo7eNw/4muo9sUKJ5b91x6Y=
X-Received: by 2002:a81:6d08:: with SMTP id
	i8-v6mr1364379ywc.114.1531408757036; 
	Thu, 12 Jul 2018 08:19:17 -0700 (PDT)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Thu, 12 Jul 2018 11:19:07 -0400
Message-ID: <CAFeBWL6aUFRraua-xyf49HYvHq=BGMNcZrmo1k6GtpvCpYETSg@mail.gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Using IMAGE_INSTALL_remove and PNBLACKLIST
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
X-List-Received-Date: Thu, 12 Jul 2018 15:19:16 -0000
Content-Type: multipart/alternative; boundary="000000000000f81a9e0570cee265"

--000000000000f81a9e0570cee265
Content-Type: text/plain; charset="UTF-8"

I am attempting to exclude a package from my system image with this in my
local.conf:

IMAGE_INSTALL_remove += "tiovx-app-host-examples"
IMAGE_INSTALL_remove += "tiovx-lib-host"
IMAGE_INSTALL_remove += "tiovx-app-host"

PNBLACKLIST[tiovx-lib-host] = "Build break"
PNBLACKLIST[tiovx-app-host] = "Build break"
PNBLACKLIST[tiovx-app-host-examples] = "Build break"

My build is still failing unfortunately:

ERROR: Nothing RPROVIDES 'tiovx-app-host-examples' (but
/home/ylee/tisdk-20180718/tisdk/sources/meta-arago/meta-arago-distro/recipes-core/packagegroups/
packagegroup-arago-tisdk-addons.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'tiovx-app-host-examples' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['tiovx-app-host-examples']
ERROR: Required build target 'packagegroup-arago-tisdk-addons' has no
buildable providers.
Missing or unbuildable dependency chain was:
['packagegroup-arago-tisdk-addons', 'tiovx-app-host-examples']

Is there something else I have to do to eliminate a package that is runtime
dependent? Thoughts?

Adam

--000000000000f81a9e0570cee265
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am attempting to exclude a package from my system image =
with this in my local.conf:<div><br></div><div><div>IMAGE_INSTALL_remove +=
=3D &quot;tiovx-app-host-examples&quot;</div><div>IMAGE_INSTALL_remove +=3D=
 &quot;tiovx-lib-host&quot;</div><div>IMAGE_INSTALL_remove +=3D &quot;tiovx=
-app-host&quot;</div><div><br></div><div>PNBLACKLIST[tiovx-lib-host] =3D &q=
uot;Build break&quot;</div><div>PNBLACKLIST[tiovx-app-host] =3D &quot;Build=
 break&quot;</div><div>PNBLACKLIST[tiovx-app-host-examples] =3D &quot;Build=
 break&quot;</div><div><br></div><div>My build is still failing unfortunate=
ly:</div></div><div><br></div><div><div>ERROR: Nothing RPROVIDES &#39;tiovx=
-app-host-examples&#39; (but /home/ylee/tisdk-20180718/tisdk/sources/meta-a=
rago/meta-arago-distro/recipes-core/packagegroups/<a href=3D"http://package=
group-arago-tisdk-addons.bb">packagegroup-arago-tisdk-addons.bb</a> RDEPEND=
S on or otherwise requires it)</div><div>NOTE: Runtime target &#39;tiovx-ap=
p-host-examples&#39; is unbuildable, removing...</div><div>Missing or unbui=
ldable dependency chain was: [&#39;tiovx-app-host-examples&#39;]</div><div>=
ERROR: Required build target &#39;packagegroup-arago-tisdk-addons&#39; has =
no buildable providers.</div><div>Missing or unbuildable dependency chain w=
as: [&#39;packagegroup-arago-tisdk-addons&#39;, &#39;tiovx-app-host-example=
s&#39;]</div><div><br></div><div>Is there something else I have to do to el=
iminate a package that is runtime dependent? Thoughts?</div></div><div><br>=
</div><div>Adam</div></div>

--000000000000f81a9e0570cee265--
