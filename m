Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msm-fsl@mcclintock.net>) id 1SFUgu-0006wU-TT
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 20:12:21 +0200
Received: by qcso7 with SMTP id o7so334633qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=+2XCGz/5WnywVTHVOwY46DUTnhuQFzusl07ZSgtOVJg=;
	b=XiYWevb7ovF0f0FGL8V7tGJUdk0mzJbb0SaZPsEs4kzNKTg4ZQsmU1OMKIo9DzO4/j
	MIs+XgiCmkOAOfqYSROl0PcamJWJ2SD5Alvp9dOimdxiN9FohldIu+JuwYlAVryfMnho
	ab9trLZLS6G1rp88WS8uRhUsZ7/1RzfHgbFJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=+2XCGz/5WnywVTHVOwY46DUTnhuQFzusl07ZSgtOVJg=;
	b=Tzs04hqdKyiNMZm3hGX6irPuo3MYlGJIQuHkhKARTr2FhkjUhjnREXqXfJL8Lrl2Gf
	UohP+LOwgqsXftrWYOsczD5mQKN5LELwcapiG79OlfdJ5FwB8Xx3vR3+P9mbYWj3AJYQ
	DPwCaQchQm1921rkolumw9Cs3ajyqZgOqxQ29ys0K1AFMklDr41sShhVRj3p0UtiElZr
	ZHgZfIHqH26SRJyovUABKTbWZ7KyXZzshOSJNVKg/rwotEVyVn9FK9vG19QWcLydGvQj
	Zm+g7hUDsTwptEe8QSjerz3sZd0Egek+XgUM/KevnHLcrzItj79jtSLOafUXeG1FTCvo
	OROQ==
Received: by 10.229.137.77 with SMTP id v13mr1356892qct.60.1333562589734; Wed,
	04 Apr 2012 11:03:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.11.234 with HTTP; Wed, 4 Apr 2012 11:02:49 -0700 (PDT)
In-Reply-To: <23c9e1f3a0ba5acbb54ae85cb194310020d3e80e.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<23c9e1f3a0ba5acbb54ae85cb194310020d3e80e.1333481624.git.mark.hatle@windriver.com>
From: Matthew McClintock <msm-fsl@mcclintock.net>
Date: Wed, 4 Apr 2012 11:02:49 -0700
Message-ID: <CAEsOVNd+9mg92Q0vx2Zqbx9Wjrxn+BcVVAMztRqpt_-a5Cf3RA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlZ2oLfvbbDwlB10MUAlVf+fxw3yJXlAhAdRGeFxDJu8j89toxOx85/qL+wZah7A2WLhVze
Subject: Re: [PATCH 4/7] conf/machine/include: Cleanup PowerPC tunings to match README
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
X-List-Received-Date: Wed, 04 Apr 2012 18:12:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 3, 2012 at 12:47 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> +ABIEXTENSION .= "${SPEABIEXTENSION}"
>
>  AVAILTUNES += "ppce500"
>  TUNE_FEATURES_tune-ppce500 = "m32 spe ppce500"
> +TUNE_PKGARCH_tune-ppce500 = "ppce500"
>  PACKAGE_EXTRA_ARCHS_tune-ppce500 = "ppce500"

meta/conf/machine/include/tune-ppce500.inc:PACKAGE_EXTRA_ARCHS_tune-ppce500
= "ppce500"
meta/conf/machine/include/tune-ppce500v2.inc:PACKAGE_EXTRA_ARCHS_tune-ppce500v2
= "ppce500v2"

Should these have ${PACKAGE_EXTRA_ARCHS_tune-powerpc} as well?

-M


