Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 49B397E078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:17:29 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f12so7076841plt.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 11:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WXsBLDGoKyhxPnc6IDxt7Ak6ceyq1whzDEZag8VQmT4=;
	b=XHYdWaDoxuXjLuulwJ48qV2YJxvrj321x5A4Z+oJQ5TCbZWb+xkdT+8s6sCW/G5TJ6
	gbsarNDw2tElQrYmyRC9IKvF94EkatBVHpY/FRV2AwRjodDGOmTZQvUytmpYUoGMqoFk
	5+tXlHBJEyt9+mpGLO/AaN6AMgBSxMLYYYFKW8Eaz7QdA2VLS5BVXjGSuUNoW0ZK+sxJ
	V4OaGucRYwKsaRLNL20NGwOEd3MEJztEK+w9QZXtouWqMffB2GhMD6bTe9usHJXO9CfJ
	4Z3Trj0wB/zF/YvInDJVXPpUaRlvlJolWrhPKgxLrKUrk6oanzBAgw9HgmIfQn5sa/H4
	aLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=WXsBLDGoKyhxPnc6IDxt7Ak6ceyq1whzDEZag8VQmT4=;
	b=FdTpDbIhvI+XLYW7zX3ASfoAJYQKc5rdVnbcyZ54kkuDxeKX8KptMVWklRjtkrcrU/
	PRVYGDdeaeWUaN7eBWmVthzenYxUDCdY/bN6d9gESArEeMMdwL4PDcuLW3AgtzRePw5g
	hY08xqrIh4ro4k+zTOr9NOR288G33lh1AxYnEiM3VnvIk+nDSAjdBp/rQJ8KdRcBtiP0
	I4A+LvZfDySoZwsHOeYJTxOeCMi+sf5i8YzYkRyfPXDt/D9FCmxrTQZ47PuN3Np1pWVZ
	ZZ8CPMIQyJklTfvdlg0jLf4dWkGwHdgTaU5waWsLGWf5hO9AUVfq+Wr1w4H4J+DrM6x9
	nLGQ==
X-Gm-Message-State: APjAAAUcBsC/GF2qB9wPLLO3nwVY/r5LMkKo1lAWpuW6wxT4a6en9dHF
	szlzUOvL+Xy8EXpUowZl4q3SFDu1TBw=
X-Google-Smtp-Source: APXvYqz2hd7AejtuX4dEqTlHr/g6jgYlcl1a4vLc/F2uYhOodIAM1XPJvQzNxgROuYV1tv71cozc/Q==
X-Received: by 2002:a17:902:d715:: with SMTP id
	w21mr61808399ply.234.1558376249688; 
	Mon, 20 May 2019 11:17:29 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	d15sm23699928pfr.179.2019.05.20.11.17.28
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 11:17:29 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20190516190105.2576-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <717ed27b-30c4-edc8-7f56-a3917e6e263a@gmail.com>
Date: Mon, 20 May 2019 11:17:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190516190105.2576-1-ross.burton@intel.com>
Subject: Re: [PATCH] glib-2.0: add missing libgcc dependency to glib-2.0-ptest
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
X-List-Received-Date: Mon, 20 May 2019 18:17:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/16/19 12:01 PM, Ross Burton wrote:
> The thread tests need libgcc for pthread_cancel to work.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-core/glib-2.0/glib.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 9ffc4560a9e..82107a8a188 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -140,6 +140,7 @@ CODEGEN_PYTHON_RDEPENDS_mingw32 = ""
>   RDEPENDS_${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
>   
>   RDEPENDS_${PN}-ptest += "\
> +            libgcc \
>               dbus \
>               gnome-desktop-testing \
>               tzdata \
> 

I wonder why shlibs is not detecting this rdep automatically. Is it 
dlopened ?

