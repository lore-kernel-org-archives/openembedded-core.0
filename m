Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2477D78A65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 17:21:48 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id o7-v6so3943769plk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PapzMd/AbPp+sAHgFdMTUeaEy8lo+l3p6Hl71ru1Vw4=;
	b=smx1kGZLG6BdfnI5+R5Q1BbBWQIIY/OE7V07t4lHs3oKh9tNrIx3LYcYZRw0Ad2Ju5
	O7djeDtfQ8C0dt78OIpx9RMlwasVZDXTmBkmFj3uGlVCUCeFWPsRIfinvPueqBX1F7Uq
	hJSukGq/2YidyCa6c1oAdGvwWsyNdAtdniU0VhfSGu+SxKF1go09+haYdEHjomJkqmv5
	h0QwVimnFNE2H9Rxk8vuRDVDJBfXqWiFJS4UfUtBfpoBz5Ra5KQh9xeXCT1TAn/wTwCw
	mK6LnFBW80maylVXSib5MfXzS3jK2p2XZpHPo2dpLCdFRR3YtHiXbcFJuOBEI4b5DAOT
	yXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=PapzMd/AbPp+sAHgFdMTUeaEy8lo+l3p6Hl71ru1Vw4=;
	b=JkcVxWJteZs8uT9BIgrVJFOFS2BkqZA/RhCFbLlKGtUGT7V60wvAqwaTaopBc60tzQ
	GMKRqqKqTdTG73KfH2rCXvOH2JbKGP6rqFtKtmxz6++6FWbt5z8ks5fVKg7FYNsgk3Cc
	HOp89fUPl/AWInUCPqipxomWQtW4uW4B4S09pIwTdN/HHa/CG8+ZHGdoGB+HC5OoOSud
	z7vCQFM4XG6TYXS9Yu8F927WZN9gJ5lSw3U0JkOob+n7hveTBFhObDRHR0AV8HrqAl4/
	zNpYrIB38QXpwFW4bmKf9fvyUv1U2ddNJKBHB8wsVUEo8KJuBijL8z0FSmJkW0ar2tZ5
	Q7gg==
X-Gm-Message-State: AOUpUlFeD9V0OnNVmoALyndtwi/TthjhQ9iAsavC2i9SWWGRisnwXSB1
	ODSn2R9NR3K9cI291u3ZsLsvCwi2
X-Google-Smtp-Source: AAOMgpe0xwpecMUG3BgWRc3aTRDSqAxKDObHBClji61FGB5k+msId9kv0nBlkvfn9iVg5vXhgmKZUg==
X-Received: by 2002:a17:902:8a92:: with SMTP id
	p18-v6mr1827925plo.148.1532020909818; 
	Thu, 19 Jul 2018 10:21:49 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:169:9401:ad7b:3cd8])
	by smtp.gmail.com with ESMTPSA id
	r87-v6sm17202113pfb.1.2018.07.19.10.21.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jul 2018 10:21:49 -0700 (PDT)
To: Alex Kiernan <alex.kiernan@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1532020379-32243-1-git-send-email-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <096e8a04-c49b-88ae-df8e-444cf4c33c94@gmail.com>
Date: Thu, 19 Jul 2018 10:21:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1532020379-32243-1-git-send-email-alex.kiernan@gmail.com>
Subject: Re: [PATCH] image: Use ${COREBASE}/meta for timestamp, fallback to bitbake.conf
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
X-List-Received-Date: Thu, 19 Jul 2018 17:21:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/19/18 10:12 AM, Alex Kiernan wrote:
> To handle the case where ${COREBASE} isn't the git directory, but
> ${COREBASE}/meta might be (since that's the layer that sets up the COREBASE
> variable), use the timestamp from there. If that fails use the timestamp
> from conf/bitbake.conf.

whats the chance that ${COREBASE}/meta might also not be a directory 
under git when compared to ${COREBASE} ?

> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
>   meta/classes/image.bbclass | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index adc50c9..0afebff 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -651,7 +651,10 @@ POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usr
>   reproducible_final_image_task () {
>       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
>           if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> -            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct`
> +            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}/meta" log -1 --pretty=%ct 2>/dev/null` || true
> +            if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" = "" ]; then
> +                REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
> +            fi
>           fi
>           # Set mtime of all files to a reproducible value
>           bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
> 

