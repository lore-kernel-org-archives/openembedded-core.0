Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8182071387
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 17:17:28 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id m20so7214194qcx.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 10:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PcUXl8a3S/y4VVkR4U8rUSrwj84AGROS6U2pbvK10wQ=;
	b=Ux8uMYsCqMnV4J9tl00aNW44T7G3rCSMOmzBwa9N9JI72FkylSxfIcbA8EEICLr1D3
	/Xg6YsnJM8Qc06O34bzOaKJNUxrjNOMI06aRYWjqkLLHl3/6xnWmP+uqg0a3NvqkzT7n
	lfNkMvh3skW8qFo1TOePXTGsXeQN6NbK+f89iKpfBFbfF9EZysIWalxJHDbxqadKbO9m
	x0wyJUAz2BBnDsEgCGNSJ0C63yzdHKeNjdRtSBWkyhvwY8ggmjKQ3H2l2L2lGrvcJNmm
	WyNzVqNsBinn+PATfPRVLrQGFEmDwmHZLWbRKJS1uchM10B6fUjj+IMAhs/AGLamMAxe
	mYUw==
X-Gm-Message-State: ALoCoQmo1sVoVkUZ8iJk0yu9KqeEgrK1jlnddLLGs7SrwBSs9fQRdsgX/wCC9lrk09BxYtp2IVdg
X-Received: by 10.229.137.131 with SMTP id w3mr57533926qct.23.1409678248764;
	Tue, 02 Sep 2014 10:17:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 2 Sep 2014 10:17:08 -0700 (PDT)
In-Reply-To: <849bb79f1189ff09c1909101b50d3284cf5f6859.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<849bb79f1189ff09c1909101b50d3284cf5f6859.1409655125.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Sep 2014 18:17:08 +0100
Message-ID: <CAJTo0LYODrmCZQbXMmjAAykNS2rgkHjY5ZL_hKF0NAU5+zQDcQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 25/26] run-postinsts.service: remove redundant line
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
X-List-Received-Date: Tue, 02 Sep 2014 17:17:33 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 11:54, Chen Qi <Qi.Chen@windriver.com> wrote:
> The basic.target itself requires sysinit.target, so there's no
> need to write this redundant line in the run-postinsts unit file.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
> index 822327a..85a0439 100644
> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
> @@ -13,5 +13,4 @@ RemainAfterExit=No
>  TimeoutSec=0
>
>  [Install]
> -WantedBy=basic.target
>  WantedBy=sysinit.target

From the commit message it sounds like you meant to remove
sysinit.target.  What is correct?

Ross

