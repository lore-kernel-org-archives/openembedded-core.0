Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UFAph-0001fJ-51
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 23:04:38 +0100
Received: by mail-ob0-f169.google.com with SMTP id ta14so3890109obb.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=u4qBVdEeqESngzGVE5gP0KCbST3UD9i0In4N7U4rn0I=;
	b=QdQwArtdyGcVc53tyjOoRTqXsXq93ymE5kaj3bGlzyMzNGdoguOMLEzlio9QuSDphX
	o0FV8F7ldIZaOlCS7xdOPOhFW8AFVr6gmITKvqKQk/fxAZiQzasZlf9G4A1baybFCNq6
	H6oFq8UxdD2g3lSDbs8k8tSAjdVCVGhPF6ldJPt0uFgBdjUoKFV0WrrXUdQh+uSbOa7V
	eQIC02Cq31+c/Jckg5MwTkAxghUbPhfDWwLa6xrYB8RPZxg6/hY7j8PKEZfdyk6gPlzN
	0boBx/fVE7xYtJxo2S2tOkl3yDCBzBOblgvte8t1e8Ij3UP3tI3FAp6HG13T2alWV7S1
	7plA==
MIME-Version: 1.0
X-Received: by 10.60.25.65 with SMTP id a1mr10406288oeg.40.1363038478014; Mon,
	11 Mar 2013 14:47:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Mon, 11 Mar 2013 14:47:57 -0700 (PDT)
In-Reply-To: <CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
References: <cover.1363031776.git.ross.burton@intel.com>
	<CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
Date: Mon, 11 Mar 2013 18:47:57 -0300
X-Google-Sender-Auth: jsQKLxh0EwHUaFjFYpQQk8Q0bWg
Message-ID: <CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/9] hybrid systemd/sysvinit
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
X-List-Received-Date: Mon, 11 Mar 2013 22:04:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 11, 2013 at 6:37 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 11 March 2013 13:07, Ross Burton <ross.burton@intel.com> wrote:
>> This series allows you to have both sysvinit and systemd in DISTRO_FEATURES.
>> Packages will be built with both init scripts, and some daemons will be linking
>> to libsystemd-daemon so that will be pulled in to sysvinit images.
>
> Regarding the upgrade path, Richard/Paul/myself discussed this over
> lunch and proposed that oe-core could gain an include file for distro
> configuration that basically injects the backward compatibility
> dependencies.  So for meta-systemd, it would inject
> replaces/provides/conflicts for each of the packages in meta-systemd.
> This would isolate the dependencies into a single location, and be
> opt-in for distros that previously shipped meta-systemd.  Hopefully
> the implementation of this is obvious, and patches to implement this
> are welcome.

I personally prefer to still use meta-oe systemd class and keep the
possibility to product images with choosen init system. I think Martin
will also prefer it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


