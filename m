Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYJmo-00063c-82
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 17:56:30 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so2953820dak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 08:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=2yJp74g+8N/gyQcg9i+kIb793f6B0FWTbUx9eNoqbT4=;
	b=w1MKWCL4A56GbDXCVcwGse7dYFG35qcY/yqhOsjRXq2zfjJY0/u6ltIPcnXNAc9i/+
	tPr7RUbPCB9nNgEQ3xzJ7N255Edl6+R7U4UgNkTAuK+5edMtxK5aRdbuz8TRQ6R65PZ4
	9iEevWc71sxvnFyJJ04GwNJNQ/2YqYWfgMiaSBWt4YL8ABUF2LMeIF9/ZgfsrFfnZcgm
	3dLz059+RWmgLZZzUu3kZyKZPnDaLPKX62/HWAnNpStBtTYy6EEnm2rGscRbYpO7bJBk
	ly5VUSTSavxfbbdQgZ+lWkliUib+URZUZb3dT3zWvyVwCdh1nerZT0M04RdCtaBn75VT
	NWXQ==
MIME-Version: 1.0
Received: by 10.68.132.196 with SMTP id ow4mr34710183pbb.49.1352824955181;
	Tue, 13 Nov 2012 08:42:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 13 Nov 2012 08:42:35 -0800 (PST)
In-Reply-To: <1352749931-10687-1-git-send-email-radu.moisan@intel.com>
References: <1352749931-10687-1-git-send-email-radu.moisan@intel.com>
Date: Tue, 13 Nov 2012 14:42:35 -0200
X-Google-Sender-Auth: E0csXU0DRJcnVmuOWkpyENA5m9g
Message-ID: <CAP9ODKoq9Ws0kOQeqp2bMoDDr5gnJpg_80L80SfKoQznWHCV0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Alexandru Damian <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] initrd: add recovery feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 16:56:30 -0000
Content-Type: multipart/alternative; boundary=047d7b15a8dfe59aa704ce631afe

--047d7b15a8dfe59aa704ce631afe
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 12, 2012 at 5:52 PM, Radu Moisan <radu.moisan@intel.com> wrote:

> Allows you to use as root a partition instead of the rootfs.img
> for recovering an old install, and fails safe when no rootfs is
> found, dropping the user to a shell if something goes wrong.
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> Signed-off-by: Alexandru Damian <alexandru.damian@intel.com>
> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> @@ -68,13 +68,49 @@ fatal() {
>
>  early_setup
>
> +# wait for the udevd to settle
> +echo "Waiting for udev to settle..."
> +sleep 3
>

Use udevadm with settle. So it use the minimal amount of time for it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b15a8dfe59aa704ce631afe
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 12, 2012 at 5:52 PM, Radu Moisan <span dir=3D"ltr">&lt;<a href=
=3D"mailto:radu.moisan@intel.com" target=3D"_blank">radu.moisan@intel.com</=
a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
Allows you to use as root a partition instead of the rootfs.img<br>
for recovering an old install, and fails safe when no rootfs is<br>
found, dropping the user to a shell if something goes wrong.<br>
<br>
Signed-off-by: Radu Moisan &lt;<a href=3D"mailto:radu.moisan@intel.com">rad=
u.moisan@intel.com</a>&gt;<br>
Signed-off-by: Alexandru Damian &lt;<a href=3D"mailto:alexandru.damian@inte=
l.com">alexandru.damian@intel.com</a>&gt;<br>+++ b/meta/recipes-core/initrd=
scripts/files/init-live.sh<br>
@@ -68,13 +68,49 @@ fatal() {<br>
<br>
=A0early_setup<br>
<br>
+# wait for the udevd to settle<br>
+echo &quot;Waiting for udev to settle...&quot;<br>
+sleep 3<br></blockquote><div><br></div><div>Use udevadm with settle. So it=
 use the minimal amount of time for it.</div><div>=A0</div></div>-- <br>Ota=
vio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S.=
 Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_b=
lank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br=
" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b15a8dfe59aa704ce631afe--
