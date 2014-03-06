Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 91AF36E826
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 10:01:19 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id x13so2512176qcv.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 02:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=y4B8YLkwXxlOimjSzcv1Mj/w0Ft3N3bmun7mNrw5M7Y=;
	b=i6dO04AP+nbxcgxI8QVOA8HXZNWX7g4Vj6jlBZtUlSSqDMjz2rz7KOH5Dk5xVrz5E/
	xYWaPKJDJEN8NYm8TI3pB+kXtM9my/Ipc+8CfDeygfXwOhO3RmH9zHyRjY6BTxuyUA4f
	GoGTvir0I4qWdeWPcnfKzl3/oGiaZ8gAlLMTRkr0MR49Iny7Y2ulDHhI/XAF8Ukkrl0C
	/sbDLTQ3xqubUZZUZ6po/oJGhCqcbaCFplVS6P1alX8ZNV35E4mFUPp+rKeG0Cta/v+b
	sj6hor0Bu5io6vt5Q9Ibu13CaaCf/Pl5wAqUAFFwy5SXpHhrLHUra+zElPfo/WEc4dbD
	WJpw==
X-Gm-Message-State: ALoCoQmY9484ld/5Fzvq7YS76mORP5+b/JEQnRGcXTmpfsgt36KgjpLM09QXJ4kjDZmh0mnDAL7R
X-Received: by 10.224.98.139 with SMTP id q11mr12942645qan.64.1394100079956;
	Thu, 06 Mar 2014 02:01:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 6 Mar 2014 02:00:59 -0800 (PST)
In-Reply-To: <1394064382-29376-1-git-send-email-sgw@linux.intel.com>
References: <1394064382-29376-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Mar 2014 10:00:59 +0000
Message-ID: <CAJTo0Lak4ArnT+KHGdioGwAYTHBDPcPs=NX55fBOyup0FxNVCQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gconf: remove depreated configure flag
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
X-List-Received-Date: Thu, 06 Mar 2014 10:01:19 -0000
Content-Type: text/plain; charset=UTF-8

On 6 March 2014 00:06, Saul Wold <sgw@linux.intel.com> wrote:
> [YOCTO #5905]
> [YOCTO #5906]
> [YOCTO #5907]
> [YOCTO #5908]
> [YOCTO #5909]
> [YOCTO #5910]
> [YOCTO #5911]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/gconf.bbclass | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
> index e9076b2..0794ba7 100644
> --- a/meta/classes/gconf.bbclass
> +++ b/meta/classes/gconf.bbclass
> @@ -10,7 +10,6 @@ export GCONF_BACKEND_DIR = "${STAGING_LIBDIR_NATIVE}/GConf/2"
>  # Disable install-time schema registration as we're a packaging system so this
>  # happens in the postinst script, not at install time.  Set both the configure
>  # script option and the traditional envionment variable just to make sure.
> -EXTRA_OECONF += "--disable-schemas-install"
>  export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL = "1"

NAK.  It's only deprecated if a recipe migrated from gconf to (eg)
gsettings.  If they didn't, they this is still required.

The fix for those bugs is to stop using gnome.bbclass as it pulls in
*all* GNOME classes, and instead use gnomebase + any other relevant
classes.

Ross

