Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id A3B887F02F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 22:31:38 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y8so14581698plr.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=59Z74IZ6frZEeUeRkSLEdMpAyiXj3H5IJc5r9GEpHIk=;
	b=cD6UleedS47D0Bd8JQ2Polf93q+y5uTSBijt7/b7NL71qsgWTX/fCcXv2N5TN8nNXe
	57vtFqUB44UxrjP8KK1ySyujgOXKERrhtO5AQoqE4BSi8LgVt91dWk7YqRfrbX0/6exR
	DZbK5XiVG0lvl6YUiq/ZVzsdBcFyAP5VeWskDujWYaZ6fN7TknC56uprbaKFKlIGp8c/
	WyQ5PKZaSKFB+lkcGISG8HtoHPEwudngFhuVi29822T8CugFXgwKoVilXXikvg+1cTLA
	6cMt9uDEarrLmbcL6lZB79mFAf0d3Z+JWqBE2p5EdNpyO+qQIqO6KjXLB/hWEPLweG8F
	Egmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=59Z74IZ6frZEeUeRkSLEdMpAyiXj3H5IJc5r9GEpHIk=;
	b=k6n8tUNwNqE259I6GkEc+61XvnSa4RH8zI82KuKyDpzo/ZwGxpWQj7w+Q+AWQG5gJL
	guBZ8mqSzkUJi9pIh7FsTevFsrMaLdmEc07lu/vTbwq36Sl8E7SK04IPIs3M0U0/nyP6
	FhaFy8lTeCJBU2rAZvpGCyX+fV0FBb7hl8Gj8u+wCW7USvkoOEhyXGceiENe2ZmFJRWD
	I3IA4KpYpWi6yCO98RfzWBFLSljtaC97Y1y8/VLoURc1wc5vELrFdqUK5D7Y0VqZqR/O
	KaOj6lY1kh0HVpR5ViH+dd/qrDlt5sdlhv451VzBar8wWByC1QNErVIqTX2Wu7Yv8lck
	N5wA==
X-Gm-Message-State: APjAAAXAwA5rj8y1LM2YCbBlfq5QdVvT7dI9TPdZKgtqZcqyhMehOOBd
	xkP3MWjd3R2PR9ZADhFHAGhJLnxV
X-Google-Smtp-Source: APXvYqypfbl0nSwdZk5ZecUfGSVMCvMmFVIRFnF2KpeHf85gQkoooWJ3KI8i8P5ta11WjTGX0Z43Tw==
X-Received: by 2002:a17:902:290b:: with SMTP id
	g11mr51926184plb.26.1563489099526; 
	Thu, 18 Jul 2019 15:31:39 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c4ab:f842:37b:5f24?
	([2601:202:4180:c33:c4ab:f842:37b:5f24])
	by smtp.gmail.com with ESMTPSA id
	r7sm31934310pfl.134.2019.07.18.15.31.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jul 2019 15:31:37 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20190718200400.19750-1-ross.burton@intel.com>
	<20190718200400.19750-3-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2df077fa-fbfe-15f6-d690-ff3f611a2128@gmail.com>
Date: Thu, 18 Jul 2019 15:31:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718200400.19750-3-ross.burton@intel.com>
Subject: Re: [PATCH 3/3] cve-update-db: refresh once every 24 hours
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
X-List-Received-Date: Thu, 18 Jul 2019 22:31:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/18/19 1:04 PM, Ross Burton wrote:
> Check the mtime of the database before updating, and if it's less than 24 hours
> ago don't refresh.  This saves the HTTP fetches to determine if the data has
> been updated.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
> index cabbde5066c..2afca94fc6b 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -22,7 +22,7 @@ python do_populate_cve_db() {
>      Update NVD database with json data feed
>      """
>  
> -    import sqlite3, urllib, shutil, gzip, re
> +    import sqlite3, urllib, shutil, gzip, re, time
>      from datetime import date
>  
>      BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
> @@ -37,6 +37,11 @@ python do_populate_cve_db() {
>      if not os.path.isdir(db_dir):
>          os.mkdir(db_dir)
>  
> +    expiry = time.time() - (60*60*24) # This time yesterday
> +    if os.path.exists(db_file) and expiry < os.path.getmtime(db_file):
> +        bb.note("CVE data updated less than 24 hours ago, not refreshing. Delete %s to force update." % db_file)
> +        return

Any reason this can't be configurable?

- armin
> +
>      # Connect to database
>      conn = sqlite3.connect(db_file)
>      c = conn.cursor()


