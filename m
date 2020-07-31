Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.9083.1596158630919177081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2020 18:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ojWzcDm5;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id g19so18139048ioh.8
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2020 18:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X/ksX0vy2uZUMwj6MSfcWW8bevyY5Y/WP4CwCnrZrjA=;
        b=ojWzcDm5tssR9voSVf+dJdjCya9hklYb5fDNpiD00467oXGiUjo7Wmt3570OJI+kJC
         ZTIMkhaQ7Ra0Y76Fbpu3gHb1vi7c8zNNvx+cP1luj9VT1+95ZiDu9cizlSiGhn3vMp2x
         AVjE5aquUjVJsDCyvKsFwXJ838gzMtVCkm38Qogi5//UCmJB0QssIGat3yw6ab9NzL6M
         oinip0XwU40lB/C1odYRuFzSzXNqgS7sI3JNipvXhae6G+LsKLNaVn3CSRQ6Z/UxN/ki
         D5Hbdwqe7cGR2JN7yviw4E4erQnGv8xX8v10EuLY7xVTyjLF4XUZ+OfF7VdAEWULR8pR
         k0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X/ksX0vy2uZUMwj6MSfcWW8bevyY5Y/WP4CwCnrZrjA=;
        b=cxvWAdPwWr7ePBZP+H4/moNCFc/e/76yZoEF5OmXHwSIFDSqApQApUW6KN/uPTKY51
         HXUlJn7p1LinuVdC//esJTpGA6n9ds0VjgJPQH/AqvgKQoFW3gFy2AxbN8yvcJ3Rx05/
         sCOwzMSF53q9HamefDXJefO12p9LosvQtNV4quHbBm6qAIRmkkIgMvzwYhRjm8B4bT4X
         61jblJHmz8SG9rzM416riTW8Cl9tGT4MMrdLG+PwVMl8ALLSgQy8rW8ZyTbHHwF2WUCl
         K6s/17nsCDk/k87FzcM4kmqOMs0Tez71Du6xMJciAtZlYxbLPw7xUg4vhWQbmXQ3ZnV5
         W4tQ==
X-Gm-Message-State: AOAM532LKZQeNOLSnx3KRPYilnaMdN6TgD7tb0dM+ooQzeJCmVZiROdt
	rOv5/cmePbLSCDvBi8+ptPIiWJ0l/nwmpe6BIR8=
X-Google-Smtp-Source: ABdhPJwTXBcl+wzMJlcJaaT8HuXhL1EZO35FoMS1EmM1mvXAXYmsh4TLck5Q2O8i4MUnvTrVRXx99Q9pm5HXSnH05Q8=
X-Received: by 2002:a5d:9752:: with SMTP id c18mr1404879ioo.10.1596158630243;
 Thu, 30 Jul 2020 18:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200730220212.442299-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200730220212.442299-1-richard.purdie@linuxfoundation.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Thu, 30 Jul 2020 18:23:39 -0700
Message-ID: <CANx9H-C1tTBovgZW0JaOD2z_4jsxdrz28PiedDEuHsonesHJGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/package_manager: Fix missing imports
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000029314105abb2a4cf"

--00000000000029314105abb2a4cf
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 30, 2020 at 3:02 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The package_manager code rearranging had some issues with module imports
> that
> were now missing. Fix all the ones I could spot from quick inspection.
>

Thank you. I started working on this but you beat me to it.


> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oe/package_manager/deb/__init__.py | 2 ++
>  meta/lib/oe/package_manager/deb/rootfs.py   | 3 ++-
>  meta/lib/oe/package_manager/deb/sdk.py      | 3 ++-
>  meta/lib/oe/package_manager/ipk/__init__.py | 3 +++
>  meta/lib/oe/package_manager/ipk/rootfs.py   | 1 +
>  meta/lib/oe/package_manager/ipk/sdk.py      | 4 ++--
>  meta/lib/oe/package_manager/rpm/__init__.py | 2 ++
>  meta/lib/oe/package_manager/rpm/sdk.py      | 2 +-
>  meta/lib/oe/sdk.py                          | 2 --
>  9 files changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/deb/__init__.py
> b/meta/lib/oe/package_manager/deb/__init__.py
> index 3c214e59dd2..72155b178c9 100644
> --- a/meta/lib/oe/package_manager/deb/__init__.py
> +++ b/meta/lib/oe/package_manager/deb/__init__.py
> @@ -2,6 +2,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>
> +import re
> +import subprocess
>  from oe.package_manager import *
>
>  class DpkgIndexer(Indexer):
> diff --git a/meta/lib/oe/package_manager/deb/rootfs.py
> b/meta/lib/oe/package_manager/deb/rootfs.py
> index ac229f63d7a..819f67eda5c 100644
> --- a/meta/lib/oe/package_manager/deb/rootfs.py
> +++ b/meta/lib/oe/package_manager/deb/rootfs.py
> @@ -2,11 +2,12 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>
> +import re
> +import shutil
>  from oe.rootfs import Rootfs
>  from oe.manifest import Manifest
>  from oe.utils import execute_pre_post_process
>  from oe.package_manager.deb.manifest import DpkgManifest
> -import re
>  from oe.package_manager.deb import DpkgPM
>
>  class DpkgOpkgRootfs(Rootfs):
> diff --git a/meta/lib/oe/package_manager/deb/sdk.py
> b/meta/lib/oe/package_manager/deb/sdk.py
> index 3876f9b6833..b25eb70b00d 100644
> --- a/meta/lib/oe/package_manager/deb/sdk.py
> +++ b/meta/lib/oe/package_manager/deb/sdk.py
> @@ -2,11 +2,12 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>
> +import glob
> +import shutil
>  from oe.utils import execute_pre_post_process
>  from oe.sdk import Sdk
>  from oe.manifest import Manifest
>  from oe.package_manager.deb import DpkgPM
> -import shutil
>
>  class DpkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=None):
> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py
> b/meta/lib/oe/package_manager/ipk/__init__.py
> index 34500b8a0a9..9603993a591 100644
> --- a/meta/lib/oe/package_manager/ipk/__init__.py
> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> @@ -2,6 +2,9 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>
> +import re
> +import shutil
> +import subprocess
>  from oe.package_manager import *
>
>  class OpkgIndexer(Indexer):
> diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py
> b/meta/lib/oe/package_manager/ipk/rootfs.py
> index 34dbcc27e64..63b4a59c401 100644
> --- a/meta/lib/oe/package_manager/ipk/rootfs.py
> +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
> @@ -4,6 +4,7 @@
>
>  import re
>  import filecmp
> +import shutil
>  from oe.rootfs import Rootfs
>  from oe.manifest import Manifest
>  from oe.utils import execute_pre_post_process
> diff --git a/meta/lib/oe/package_manager/ipk/sdk.py
> b/meta/lib/oe/package_manager/ipk/sdk.py
> index e6d7b04bb88..47c0a92c1b6 100644
> --- a/meta/lib/oe/package_manager/ipk/sdk.py
> +++ b/meta/lib/oe/package_manager/ipk/sdk.py
> @@ -2,12 +2,12 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>
> +import glob
> +import shutil
>  from oe.utils import execute_pre_post_process
>  from oe.sdk import Sdk
>  from oe.manifest import Manifest
>  from oe.package_manager.ipk import OpkgPM
> -import shutil
> -import glob
>
>  class OpkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=None):
> diff --git a/meta/lib/oe/package_manager/rpm/__init__.py
> b/meta/lib/oe/package_manager/rpm/__init__.py
> index 6183f81d586..c91f61ae5c1 100644
> --- a/meta/lib/oe/package_manager/rpm/__init__.py
> +++ b/meta/lib/oe/package_manager/rpm/__init__.py
> @@ -2,6 +2,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>
> +import shutil
> +import subprocess
>  from oe.package_manager import *
>
>  class RpmIndexer(Indexer):
> diff --git a/meta/lib/oe/package_manager/rpm/sdk.py
> b/meta/lib/oe/package_manager/rpm/sdk.py
> index 4d3f9461ef9..b14b155a85e 100644
> --- a/meta/lib/oe/package_manager/rpm/sdk.py
> +++ b/meta/lib/oe/package_manager/rpm/sdk.py
> @@ -2,11 +2,11 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>
> +import glob
>  from oe.utils import execute_pre_post_process
>  from oe.sdk import Sdk
>  from oe.manifest import Manifest
>  from oe.package_manager.rpm import RpmPM
> -import glob
>
>  class RpmSdk(Sdk):
>      def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
> index 49f519891fb..fdcadcb8dee 100644
> --- a/meta/lib/oe/sdk.py
> +++ b/meta/lib/oe/sdk.py
> @@ -7,8 +7,6 @@ from oe.utils import execute_pre_post_process
>  from oe.manifest import *
>  from oe.package_manager import *
>  import os
> -import shutil
> -import glob
>  import traceback
>
>  class Sdk(object, metaclass=ABCMeta):
> --
> 2.25.1
>
> 
>

--00000000000029314105abb2a4cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto"><br></div></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 30, 2020 at 3:02 PM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">The package_manager code rearranging had some issues with module im=
ports that<br>
were now missing. Fix all the ones I could spot from quick inspection.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you. I st=
arted working on this but you beat me to it.<br></div><div dir=3D"auto"><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/lib/oe/package_manager/deb/__init__.py | 2 ++<br>
=C2=A0meta/lib/oe/package_manager/deb/rootfs.py=C2=A0 =C2=A0| 3 ++-<br>
=C2=A0meta/lib/oe/package_manager/deb/sdk.py=C2=A0 =C2=A0 =C2=A0 | 3 ++-<b=
r>
=C2=A0meta/lib/oe/package_manager/ipk/__init__.py | 3 +++<br>
=C2=A0meta/lib/oe/package_manager/ipk/rootfs.py=C2=A0 =C2=A0| 1 +<br>
=C2=A0meta/lib/oe/package_manager/ipk/sdk.py=C2=A0 =C2=A0 =C2=A0 | 4 ++--<=
br>
=C2=A0meta/lib/oe/package_manager/rpm/__init__.py | 2 ++<br>
=C2=A0meta/lib/oe/package_manager/rpm/sdk.py=C2=A0 =C2=A0 =C2=A0 | 2 +-<br=
>
=C2=A0meta/lib/oe/sdk.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 --<br>
=C2=A09 files changed, 15 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/pac=
kage_manager/deb/__init__.py<br>
index 3c214e59dd2..72155b178c9 100644<br>
--- a/meta/lib/oe/package_manager/deb/__init__.py<br>
+++ b/meta/lib/oe/package_manager/deb/__init__.py<br>
@@ -2,6 +2,8 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
<br>
+import re<br>
+import subprocess<br>
=C2=A0from oe.package_manager import *<br>
<br>
=C2=A0class DpkgIndexer(Indexer):<br>
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/packa=
ge_manager/deb/rootfs.py<br>
index ac229f63d7a..819f67eda5c 100644<br>
--- a/meta/lib/oe/package_manager/deb/rootfs.py<br>
+++ b/meta/lib/oe/package_manager/deb/rootfs.py<br>
@@ -2,11 +2,12 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
<br>
+import re<br>
+import shutil<br>
=C2=A0from oe.rootfs import Rootfs<br>
=C2=A0from oe.manifest import Manifest<br>
=C2=A0from oe.utils import execute_pre_post_process<br>
=C2=A0from oe.package_manager.deb.manifest import DpkgManifest<br>
-import re<br>
=C2=A0from oe.package_manager.deb import DpkgPM<br>
<br>
=C2=A0class DpkgOpkgRootfs(Rootfs):<br>
diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_=
manager/deb/sdk.py<br>
index 3876f9b6833..b25eb70b00d 100644<br>
--- a/meta/lib/oe/package_manager/deb/sdk.py<br>
+++ b/meta/lib/oe/package_manager/deb/sdk.py<br>
@@ -2,11 +2,12 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
<br>
+import glob<br>
+import shutil<br>
=C2=A0from oe.utils import execute_pre_post_process<br>
=C2=A0from oe.sdk import Sdk<br>
=C2=A0from oe.manifest import Manifest<br>
=C2=A0from oe.package_manager.deb import DpkgPM<br>
-import shutil<br>
<br>
=C2=A0class DpkgSdk(Sdk):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, d, manifest_dir=3DNone):<br>
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pac=
kage_manager/ipk/__init__.py<br>
index 34500b8a0a9..9603993a591 100644<br>
--- a/meta/lib/oe/package_manager/ipk/__init__.py<br>
+++ b/meta/lib/oe/package_manager/ipk/__init__.py<br>
@@ -2,6 +2,9 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
<br>
+import re<br>
+import shutil<br>
+import subprocess<br>
=C2=A0from oe.package_manager import *<br>
<br>
=C2=A0class OpkgIndexer(Indexer):<br>
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/packa=
ge_manager/ipk/rootfs.py<br>
index 34dbcc27e64..63b4a59c401 100644<br>
--- a/meta/lib/oe/package_manager/ipk/rootfs.py<br>
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py<br>
@@ -4,6 +4,7 @@<br>
<br>
=C2=A0import re<br>
=C2=A0import filecmp<br>
+import shutil<br>
=C2=A0from oe.rootfs import Rootfs<br>
=C2=A0from oe.manifest import Manifest<br>
=C2=A0from oe.utils import execute_pre_post_process<br>
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_=
manager/ipk/sdk.py<br>
index e6d7b04bb88..47c0a92c1b6 100644<br>
--- a/meta/lib/oe/package_manager/ipk/sdk.py<br>
+++ b/meta/lib/oe/package_manager/ipk/sdk.py<br>
@@ -2,12 +2,12 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
<br>
+import glob<br>
+import shutil<br>
=C2=A0from oe.utils import execute_pre_post_process<br>
=C2=A0from oe.sdk import Sdk<br>
=C2=A0from oe.manifest import Manifest<br>
=C2=A0from oe.package_manager.ipk import OpkgPM<br>
-import shutil<br>
-import glob<br>
<br>
=C2=A0class OpkgSdk(Sdk):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, d, manifest_dir=3DNone):<br>
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/pac=
kage_manager/rpm/__init__.py<br>
index 6183f81d586..c91f61ae5c1 100644<br>
--- a/meta/lib/oe/package_manager/rpm/__init__.py<br>
+++ b/meta/lib/oe/package_manager/rpm/__init__.py<br>
@@ -2,6 +2,8 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
<br>
+import shutil<br>
+import subprocess<br>
=C2=A0from oe.package_manager import *<br>
<br>
=C2=A0class RpmIndexer(Indexer):<br>
diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_=
manager/rpm/sdk.py<br>
index 4d3f9461ef9..b14b155a85e 100644<br>
--- a/meta/lib/oe/package_manager/rpm/sdk.py<br>
+++ b/meta/lib/oe/package_manager/rpm/sdk.py<br>
@@ -2,11 +2,11 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
<br>
+import glob<br>
=C2=A0from oe.utils import execute_pre_post_process<br>
=C2=A0from oe.sdk import Sdk<br>
=C2=A0from oe.manifest import Manifest<br>
=C2=A0from oe.package_manager.rpm import RpmPM<br>
-import glob<br>
<br>
=C2=A0class RpmSdk(Sdk):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, d, manifest_dir=3DNone, rpm_workdir=
=
=3D&quot;oe-sdk-repo&quot;):<br>
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py<br>
index 49f519891fb..fdcadcb8dee 100644<br>
--- a/meta/lib/oe/sdk.py<br>
+++ b/meta/lib/oe/sdk.py<br>
@@ -7,8 +7,6 @@ from oe.utils import execute_pre_post_process<br>
=C2=A0from oe.manifest import *<br>
=C2=A0from oe.package_manager import *<br>
=C2=A0import os<br>
-import shutil<br>
-import glob<br>
=C2=A0import traceback<br>
<br>
=C2=A0class Sdk(object, metaclass=3DABCMeta):<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000029314105abb2a4cf--
