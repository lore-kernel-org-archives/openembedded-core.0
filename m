Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD4A06C489
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 17:57:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAKHvQmn028418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 20 Nov 2018 17:57:27 GMT
Message-ID: <97ede2dfe6526ff59d34e239aa25e192ad653401.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 17:57:26 +0000
In-Reply-To: <20181119150810.94381-1-alex.kanavin@gmail.com>
References: <20181119150810.94381-1-alex.kanavin@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/6] libmodulemd: add a new recipe
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
X-List-Received-Date: Tue, 20 Nov 2018 17:57:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-11-19 at 16:08 +0100, Alexander Kanavin wrote:
> This is a hard requirement of the new libdnf versions.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...ec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch | 21 ++++++
>  ...n.build-do-not-generate-gir-or-gtkdo.patch | 65
> +++++++++++++++++++
>  .../libmodulemd/libmodulemd_git.bb            | 21 ++++++
>  3 files changed, 107 insertions(+)
>  create mode 100644 meta/recipes-
> devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-
> usr-bin-sh.patch
>  create mode 100644 meta/recipes-
> devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-
> generate-gir-or-gtkdo.patch
>  create mode 100644 meta/recipes-
> devtools/libmodulemd/libmodulemd_git.bb

I think something in this series may have caused:


https://autobuilder.yoctoproject.org/typhoon/#/builders/11/builds/230/steps/7/logs/step1c

https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/230/steps/7/logs/step1c
and maybe some (but not all) of:


https://autobuilder.yoctoproject.org/typhoon/#/builders/28/builds/242/steps/7/logs/step2d

Cheers,

Richard


