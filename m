Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id DD6A96FE24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 16:38:28 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id r5so747918qcx.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 09:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Tcn9/MLcgoUtAFx5CLGPBF3Jvjo6AK80dPSX712zwok=;
	b=M35sjeWzaT6aIC5UAMJvYItpiEV6w6rUPFMgF/YnNxUxrd2O+aBB7jV3Ut18z0YTMg
	n37KFQJCuTp+tkAatxicOKmtRWioSrePMgkxgLzzTW1ydFJgjbD2Pw+Cv3gmDtDnOuoY
	B3PIiB9atbGZm9TTD9XF6wug3VfER642PBHOgNUQSGuRDQvXQYQV7bqD3cLPY8xAE/pU
	KuxGaTIuU4kc3oDtIPfsozjPqkncrcfxUU5KfWu5iGcZacXezO0gZb2ykXIGIc4ccZhY
	+XZCq5yv2BMR6aK5YfAL4v5D5Ro0ooU1HTZGSL/icQf+mwKVCI5/uKVKwO4ba0PIJPsH
	IMeg==
X-Gm-Message-State: ALoCoQkUXTEhoa3hzW9MLyawsndP/xSlJ+hjiOQFA/s3uwc2x5epH7a5qII+TJlyC8JJEEZ+HGrr
X-Received: by 10.224.43.211 with SMTP id x19mr5451108qae.17.1402677509699;
	Fri, 13 Jun 2014 09:38:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Fri, 13 Jun 2014 09:38:09 -0700 (PDT)
In-Reply-To: <539B27F0.90109@gmail.com>
References: <539B27F0.90109@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jun 2014 17:38:09 +0100
Message-ID: <CAJTo0Lauenh9=Mep+4ZUVPnjf0yJDdaCxbrNcB5vXEmtjn5-iA@mail.gmail.com>
To: =?UTF-8?Q?Miroslav_Ke=C5=A1?= <miroslav.kes@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: cmake: respect ${S} and ${B} patch problem
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
X-List-Received-Date: Fri, 13 Jun 2014 16:38:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 June 2014 17:33, Miroslav Ke=C5=A1 <miroslav.kes@gmail.com> wrote:
> +    if [ -z "${OECMAKE_SOURCEPATH}" ]; then
> +        OECMAKE_SOURCEPATH=3D"${S}"
>      fi
>
>      if [ "${S}" !=3D "${B}" ]; then
> @@ -84,7 +88,7 @@ cmake_do_configure() {
>
>      cmake \
>        ${OECMAKE_SITEFILE} \
> -      ${S} \
> +      ${OECMAKE_SOURCEPATH} \

A better idiom that's more self-documenting would be to set
OECMAKE_SOURCEPATH ?=3D "${S}" at the top-level.

Would it be sensible to give that variable a different name as it
refers specifically to the location of the cmake file, and not the
rest of the source?

Ross

