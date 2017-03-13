Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3350277714
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 20:21:08 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u132so11727858wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 13:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a8uiKNoFOj1I3V5oGsp0NTByi6V6qrYBtxG9RUgGlp8=;
	b=OECG94nRhbvcSlP+h19DeK4kGJtOC53bFrcgLkCp6L6AxjvsQWKVp9nDTHOn3Od44F
	6d+R/yhIcvJN1USkB5TL7RkKkIDkGx65X9e3rtpfWQi9zfVb3bUWoQPlGFE/WeLZtroV
	LUk0ENy6CvZlXhKXbOkw4kPgonhqq5Ti8xU7+58c81zqbUmzkugS2h/pBd4mzS34DD7M
	yY18Q3wEwe+pJd89u3zRgCFqukghmF7HK3vMJsHjbE56F5kouCijhEvJMZoNch3kJvKI
	XRzwi09S+QZ/YBgObTNatpzz0ykf9im12BDJpd0yK49P5swH/7/UdAYw7Y9Vqr8i7Wdx
	vsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a8uiKNoFOj1I3V5oGsp0NTByi6V6qrYBtxG9RUgGlp8=;
	b=nQIZSDhkzp4nGTt5nspytqv8Z8ovqEResLgt1m97nG03p1SryJcDkcrK/XRwuIR/mJ
	003bZb4nHyP9NNv2qsrvNLSYSRiHKgh2aXyzc3rafjbdzrhWoTbS2RyZCn+gBXlS/C1e
	DXWHctb5tjdd1ng+EYHwT5UtgSgktAt/h35Zoho58OPFjUf54AjczDHPFFqIarqA0EqP
	s1dL+RI3Z1nNYOE4WpYqAp9TSDWDxqCustSlW7bHzcH7keCNn2kqt+17ARpijWqTjZc5
	/PVsJ0zqMdJJtjkjUrZz7ES2STpkR8biR9P7fy2UynvavJ2pn2DaCtrSEu3c316BAyX4
	IsnA==
X-Gm-Message-State: AFeK/H2AadIvCVPcBUe0iFq+7aBhaac8G0kVbS3JunMsA0WGjD58VveylM/n1Exj0IiLMpOe4S93lnbuJYGx5w==
X-Received: by 10.28.140.135 with SMTP id o129mr11301235wmd.101.1489436469622; 
	Mon, 13 Mar 2017 13:21:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Mon, 13 Mar 2017 13:20:39 -0700 (PDT)
In-Reply-To: <1489398100-31546-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489398100-31546-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Mar 2017 13:20:39 -0700
Message-ID: <CAMKF1sq=2vSP=e7ijC=AvVJd2_wtj=jaUJ8-=G9cz4wX1JjCuA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal: Use original PATH for terminals
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
X-List-Received-Date: Mon, 13 Mar 2017 20:21:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 13, 2017 at 2:41 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Now that we filter out PATH to only the utilities we rely upon, the devshel
> terminal was broken since it can no longer find the terminals. Even if
> we fix that, the user couldn't access any of their commands within
> devshell which somewhat defeats its purpose.
>
> Add the original PATH back to the environment to restore that behaviour
> since this is more in line with user expectations and it wouldn't be possible
> (or desireable) to whitelist all the commands a user might want to use from
> the shell.
>

will this also mean that it will now, inject original PATH into builds done
using seashell ?

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/terminal.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
> index 62409c0..a27e10c 100644
> --- a/meta/classes/terminal.bbclass
> +++ b/meta/classes/terminal.bbclass
> @@ -66,6 +66,11 @@ def oe_terminal(command, title, d):
>              envdata.setVar(key, str(value))
>              envdata.setVarFlag(key, 'export', '1')
>
> +    # Use original PATH as a fallback
> +    path = d.getVar('PATH') + ":" + origbbenv.getVar('PATH')
> +    os.environ['PATH'] = path
> +    envdata.setVar('PATH', path)
> +
>      # A complex PS1 might need more escaping of chars.
>      # Lets not export PS1 instead.
>      envdata.delVar("PS1")
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

