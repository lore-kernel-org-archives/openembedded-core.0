Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 58B207CBE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 10:41:55 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id l18so3861354lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 02:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=W+f5ODthdz/agsK5EqaMi/GHAzJItli/Ins2AMtv7S4=;
	b=fBpQp7inbIRQYz7CBvQS6kAk4rxcfNSxM9gQaRqGT0E8mZ5ApvJ6TcGDEaOW+ZvtDu
	2UJyT0DP3uOlc9OmqtWXKkB/eJ/RPME25XVRPkFyZmYDy4zzAHdox3GzBUAKCRqr4o2q
	Kd5TLglwr3+f9auybtbbHb9qwvL/lX43rX6RqKwNHv51WPCOZ/4/dnYNx4KMutzgsu/Z
	jtm/g33KD0hurHi5UkFdEVrDFvJHIPhoGhwppXfHMRsV+5ZaCACYvghhG3RkQfmfd6rV
	l31tTTlVacLvK2K/WEeygttc9U53AG7WyytHjc7WL4e49GwrzGMZMBN0HHJpy/dEO4I2
	+SIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=W+f5ODthdz/agsK5EqaMi/GHAzJItli/Ins2AMtv7S4=;
	b=pejFc1CXsxTKO5QWhDq0WvHUY53w9jeikV6y/fXArywVGQF1bNTmo+cZxHuDnuCpfr
	VGxd07tJrIOhbe+rHSWl3YQmSo27yDDcDsRvrXqMEuCG+sS6cT5sxH89tzr/gBtvQzsJ
	pNzASK+WHwfwNvblP1gWlpQtQwNETIpROalwXC22lo43CRBtx8To3KOEoCRxiZ+h4RuV
	iAXMka8SpNdxOhyMtbu6mAiX2f6JknpqRl+IalW5x/1SVKIf+i1Ix4XF9+NxziZ/FjBA
	HzFuyi6y9PtXen5ZyWw5qrlomkOTedXRVCArQuTg9PPxi4q4djqI8OWea4MuW5PoplXw
	5bVQ==
X-Gm-Message-State: APjAAAU1mM3zGQfoFHiqT6dyKH9KrM4yJUoimf6mmtOg3ldIlh9Chdw6
	bRJ0r6/bMwUEDL//jf1Ncb6i1NKF
X-Google-Smtp-Source: APXvYqzefJVH+I4PtBqURw4IJ3aZteGqnixURlCPvzFfS0xeKvtZeHdvS7W6EwQ3cdnP08KCLT2YTQ==
X-Received: by 2002:a19:5057:: with SMTP id z23mr15910732lfj.132.1576492915540;
	Mon, 16 Dec 2019 02:41:55 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	t1sm10143322lji.98.2019.12.16.02.41.53
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 16 Dec 2019 02:41:54 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191216095620.3747-1-Martin.Jansa@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <978a0738-d342-9b5e-8a46-e9cb46c5df54@gmail.com>
Date: Mon, 16 Dec 2019 11:41:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216095620.3747-1-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] sstate.bbclass: use tabs for indentation
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
X-List-Received-Date: Mon, 16 Dec 2019 10:41:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/16/19 10:56 AM, Martin Jansa wrote:
> * it's terrible, but this is what oe-core wants and it's better than mixing tabs and spaces in the same function
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/classes/sstate.bbclass | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 14de791c81..18e3492674 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -753,13 +753,13 @@ sstate_create_package () {
>   		return
>   	fi
>   
> -        mkdir -p `dirname ${SSTATE_PKG}`
> +	mkdir -p `dirname ${SSTATE_PKG}`
>   	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
>   
> -        # Use pigz if available
> -        OPT="-czS"
> -        if [ -x "$(command -v pigz)" ]; then
> -            OPT="-I pigz -cS"
> +	# Use pigz if available
> +	OPT="-czS"
> +	if [ -x "$(command -v pigz)" ]; then
> +		OPT="-I pigz -cS"
>           fi
>   

Nice cleanup. Doesn't this final 'fi' still look funky though ?

>   	# Need to handle empty directories
> 

