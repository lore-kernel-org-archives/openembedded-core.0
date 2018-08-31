Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	by mail.openembedded.org (Postfix) with ESMTP id C29C4771B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 11:25:10 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id f4-v6so7894290uao.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 04:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3AH9y0pv5z6iF1GOzK3X8+v4WC4D8B/K8+ELFu1EfZw=;
	b=uSVlEJrzb/2p/q+210wqy/pFPFAH31LfZV95YtNnbTuLEcPZG7YVhV9GMeEe55O56w
	TwcnFfPNCxbiFS3FG/4iwWWKTANyNXtTPEL+tft/NhJ5dunhBelptbIRfLEqrElQr6OS
	86hY0lJp7v0P0rxoYqYTJSqQelB64Ra3SbEIRDXRQ2WJqt7mOY08qin/GGktBTOd38Jz
	iKgRk+R5djSdxxdb5kLYUJclYRBkQmawRalcMYTSGLKWOG7A2zoAFQFjoXQ8+H+7HVjc
	T5drEK8Trlqdj5AS20PL6k/BzboHbYZBFRUVi/7rQo//lt8URMxRArLbPr095Aal/SAS
	c5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3AH9y0pv5z6iF1GOzK3X8+v4WC4D8B/K8+ELFu1EfZw=;
	b=UbnsLgREUWayDLEX7fy/tZ4vmI4JHB5W66Tr7PlCARrnVPwPs0a+3uOF944+y1wev9
	eiDpj/Zu0/hjpb1SQKTyhuZadSKuqixC8QmkaAGL+uCnYqbheLlGmwYRxa4PjMb4OXCc
	O2b3TN7rnC/6yTaGKxybYEhL1gOHGZdBzKtQwJZrqXO3e4Tp3I3NfkkKpaVqxkKNxZto
	9n+3y4Es4ohf2fSaRVr0DR9uvqfDD5mjdeYD8Z2Jkam7Wyozo6YyT7s4UhYZoTgzFVKm
	lG5/Nwz6VaaVzK9UAoBctCRljCFjRwSKaRmBld5TSSiuFe0OuW2Y45RMvnQF/6oR2zqB
	xTcg==
X-Gm-Message-State: APzg51D1kJrqVRJGPAXIwSMOWXX65+V2S+gN+T+9Q5RTBnJHLEZfj2TT
	shIprRCXIMaZz5NLtGSd6kxMJkGAex8PQPdvz4GikxvJ
X-Google-Smtp-Source: ANB0VdYMnjw2o/6Lgs3tIKi9+BxbnTbJki37Oj6r/tzXrL2N5rh9L3+QXPhV+07aQhE+LMbzP2CpIH20omvPljk3FmY=
X-Received: by 2002:a67:3fca:: with SMTP id q71-v6mr2336482vsi.1.1535714711546;
	Fri, 31 Aug 2018 04:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5Q2QLz-TM-0Nugzj15Qzpdj1xFaLptGR_KJL6qtWQi7wg@mail.gmail.com>
	<52bd5fc7-c48c-d1ed-019d-b5f2b0bb8722@xilinx.com>
In-Reply-To: <52bd5fc7-c48c-d1ed-019d-b5f2b0bb8722@xilinx.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 31 Aug 2018 12:25:00 +0100
Message-ID: <CAO5Uq5RkP_cc9KVA7rceXLUBP4VxjHGNwNtQQ3745WkKSo=SHg@mail.gmail.com>
To: alejandro.enedino.hernandez-samaniego@xilinx.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Multiconfig builds broken in master
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
X-List-Received-Date: Fri, 31 Aug 2018 11:25:10 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for the reply and the help.

I'm trying and failing to reproduce it separated out into a simple
reproducible example... my supposition is it's something in our custom
distro config that's wrong, which this change shows up, but I've
failed to find it so far. If I comment out enough checks so that it
doesn't fail on checks inside the layers so I can run `bitbake -e`
then I get DISTRO_FEATURES which includes everything I expect.

On Wed, Aug 29, 2018 at 9:02 PM Alejandro Enedino Hernandez Samaniego
<alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:
>
> Hello Alex,
>
> Firs of all, your issue is not a multiconfig problem, and is not caused
> by commit b8730f6 .
>
>
> I was able to reproduce your problem before and after reverting the
> specified commit.
>
>
> As your error log says, ostree is not in the list of valid image
> features, if you add debug flags to bitbake
>
> you can see that the ostree-image.bbclass file is not even being parsed,
> hence why ostree was never added
>
> as a valid image feature.
>
>
> Why was it never parsed?
>
> because theres no INHERITs/inherits pointing to it.
>
> greping though the iot-refkit repo we can see that for example the
> refkit-image (I don't know what your production image is based on I'm
> just assuming) contains the following:
>
> meta-refkit-core/classes/refkit-image.bbclass: inherit
> ${@oe.utils.all_distro_features(d, 'ostree', 'ostree-image')}
>
> So it will only be inherited if the DISTRO_FEATURE ostree is included.
>
> Adding ostree to DISTRO_FEATURES on the <multiconf>.conf, allows the
> build to find the ostree IMAGE_FEATURE correctly.
>
>
> Alejandro
>
>
>
>
> On 08/29/2018 06:39 AM, Alex Kiernan wrote:
> > I've run into a weird multiconfig problem on master which seems to
> > have been introduced with
> >
> > b8730f6 ("bitbake: bitbake: Add support for multiconfig dependencies")
> >
> > Before that, I could happily use:
> >
> > bitbake multiconfig:gplv2:production-image
> >
> > whereas now it fails (gplv2 is a multiconfig which basically just sets
> > TMPDIR and INCOMPATIBLE_LICENSES).
> >
> > The error suggests failure to populate IMAGE_FEATURES correctly:
> >
> > ERROR: Nothing PROVIDES 'production-image'
> > production-image was skipped: 'ostree' in IMAGE_FEATURES is not a
> > valid image feature. Valid features: allow-empty-password
> > allow-root-login autologin dbg-pkgs debug-tweaks dev-pkgs doc doc-pkgs
> > eclipse-debug empty-root-password hwcodecs muted nfs-client nfs-server
> > package-management post-install-logging ptest-pkgs read-only-rootfs
> > splash ssh-server-dropbear ssh-server-openssh staticdev-pkgs
> > tools-debug tools-profile tools-sdk tools-testapps usb-nmc x11
> > x11-base x11-sato
> >
> > (the ostree feature is introduced by a layer derived from the Intel
> > IoT refkit - https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/classes/ostree-image.bbclass)
> >
> > If I revert that single commit everything works again.
> >
> > Clearly there's nothing in that changeset which is touching
> > IMAGE_FEATURES, so it's something way more subtle!
> >
>


--
Alex Kiernan

