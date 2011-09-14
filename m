Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3t2R-0006r8-0J
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 19:14:19 +0200
Received: by bke11 with SMTP id 11so1671444bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 10:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=v1toHVkKslWb2pZVgt+3ng8aXX8T3H81wYZZ91979eI=;
	b=YwRzsAeFyxeCeXGzw8sDodJUCEuBZteNeZhMaBuoZUV8ytkLmh8+y/Z1pIeogUQadU
	ZTL0VJnMLi8gvRMUUQZ0AJVjS4fqVJRqgn9IfzQX0GiMxG8uSyTBvl7mh6qLKHiDBZ/X
	GLi6s7W4dB5X97Ug7Tjj8uo9V8JJzoK8I1EC4=
MIME-Version: 1.0
Received: by 10.204.3.23 with SMTP id 23mr40335bkl.301.1316020146931; Wed, 14
	Sep 2011 10:09:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 10:09:06 -0700 (PDT)
In-Reply-To: <08786b67dc4dc72eb442e750b77640dcb1d95ad9.1315994642.git.nitin.a.kamble@intel.com>
References: <cover.1315994642.git.nitin.a.kamble@intel.com>
	<08786b67dc4dc72eb442e750b77640dcb1d95ad9.1315994642.git.nitin.a.kamble@intel.com>
Date: Wed, 14 Sep 2011 14:09:06 -0300
X-Google-Sender-Auth: rORGcjdhPUtKoxFiSrMpEHOONrc
Message-ID: <CAP9ODKoTCy77n_NzVFQPUH0n2a=JsSx_o3UctBcvPA3uvF0AJA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cmake-native: fix symbol not found error on old distros
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2011 17:14:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 07:13,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> more information in the patch file

Please put the information on the commit log since people shouldn't
need to look into the patch file to gather it.
...
> +++ b/meta/recipes-devtools/cmake/cmake/fix_for_running_on_older_distros.=
diff
> @@ -0,0 +1,26 @@
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Fixes bug: [YOCTO #1459]
> +
> +When sstate files are shared from newer distro machine to older distro m=
achine,
> +the binaries can fail to run due to missing newer symbols from the newer
> +libraries as seen bellow:
> +
> + =A0 =A0 =A0U _ZNSt15_List_node_base7_M_hookEPS_@@GLIBCXX_3.4.14
> + =A0 =A0 =A0U _ZNSt15_List_node_base9_M_unhookEv@@GLIBCXX_3.4.14
> +
> +This patch makes libstdc++ linking static. so the build system need to h=
ave libstdc++-static package installed before building cmake.
> +
> +Date: 2011/09/09
> +Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> +diff -rup 1/CompileFlags.cmake 3/CompileFlags.cmake
...

The header is not following the policy; More at
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Head=
ers_and_Commit_Messages

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


