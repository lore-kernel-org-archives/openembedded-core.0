Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0601860234
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 16:47:38 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s10so1314575plp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 08:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=fNanN3PNccBEvhd3HpXDNxS0qzABzmr1+Fbqu1VIDfw=;
	b=prAqov5Tzes58mZbKsBMWatb+O8YMybFXsyQZxDPY5uxG/k4RBcN7mlzKTgruOVtMB
	T3EzGq6aRQJ6m+zMGRBbs+PuoatmZvkaiDqGM2s9R1nKsRBY5NGe+ZjoSAkfZInY2F+R
	nea1J8OsiI6Syh2s9ZFaEr+aS3gz1IIzik6UctKV4ApaRWA3DrKSAVqHsBowCtuuke4J
	jQWrQNtrAR1rXrFOKS98Z1Wciqz424Wz8iCNBe59KBbDYb9orfEWG2HAYUnJrOAxbUd0
	d9lOlSPDNA+huylIRONNM4VU5tpBPIFE86aEhcSucAFu7nTG4WNwBmOEyelsg+PrV3FB
	7XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=fNanN3PNccBEvhd3HpXDNxS0qzABzmr1+Fbqu1VIDfw=;
	b=SeW8g3FZOeT+AKprGetiZWPWDJtTNMpXqz99rRHIgrh1DdKj0kZEkiFaHUe7p9Kauj
	yUJjURsgxCYV9v+8s0q8ALtSzIxVcZIOaoqrNbfAffpCZzgZBRLO3cAlYx4KnB85rtvM
	fjHAG5bIcn6s2Mm+76cH2kGT5ekAhqTKB4HNQEELTGA/DvlnF5llyfxhRYKKyKsvrxaD
	3Oeym59sPWpFrquBdrruZse143Ms5tZXcTb/7XtPLTEkSK11E3H2HoRMhpbhsX3lzeIZ
	RryVdKSPVyOU5dL3djReMRlDs3gjlTbAVLUa/axteLoeM+T8ZulWF6lzum4LBKQYx30l
	FtCA==
X-Gm-Message-State: APjAAAXSSZ9Rn1EYHNO15sIJSIK1nqSms7lRA4sNRImU6OFN76VC1sAo
	gadtd6FYQusoRnXzKEQPglA=
X-Google-Smtp-Source: APXvYqyWEbRQra0FGOfr9lSqUj+QE3vQMUyD/cvlUnAYg5NeZWS6/Ft+ImuaAY1NncM2f2gxiouDpw==
X-Received: by 2002:a17:902:20b:: with SMTP id
	11mr4769285plc.224.1573663659407; 
	Wed, 13 Nov 2019 08:47:39 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	e198sm3803005pfh.83.2019.11.13.08.47.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 08:47:38 -0800 (PST)
Message-ID: <8a69c862cddc4272fb716c5e2fbe92fcfb1bbfd2.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 08:47:33 -0800
In-Reply-To: <1573547565-352904-1-git-send-email-changqing.li@windriver.com>
References: <1573547565-352904-1-git-send-email-changqing.li@windriver.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Subject: Re: [PATCH] report-error.bbclass: replace angle brackets with &lt; and &gt;
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
X-List-Received-Date: Wed, 13 Nov 2019 16:47:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-11-12 at 16:32 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> when we have below content in local.conf or auto.conf:
> BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj <raj.khem@gmail.com>"
> send-error-report will fail with "HTTP Error 500: OK"
> 
> error-report-web do rudimentary check on all fields that are
> passed to the graphs page to avoid any XSS happening, if contains
> '<', the server will return error(Invalid characters in json).
> fixed by use escape of <> to replace it.
> 
> NOTE: with this change, error-report-web need to add filter 'safe'
> for the string wanted to display to avoid further HTML escaping
> prior to output. Below is how the content displayed on webpage:
> with the filter 'safe':
> BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj <raj.khem@gmail.com>"
> without the filter 'safe':
> BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj &lt;raj.khem@gmail.com&gt;"
> 
> Another patch for error-report-web will send to yocto mail list.
> 
> [YOCTO #13252]
> 

This patch fixes my problem. LGTM

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes/report-error.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-
> error.bbclass
> index 1a12db1..6046867 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -36,6 +36,7 @@ def get_conf_data(e, filename):
>                      continue
>                  else:
>                      jsonstring=jsonstring + line
> +    jsonstring = jsonstring.replace("<", "&lt;").replace(">",
> "&gt;")
>      return jsonstring
>  
>  python errorreport_handler () {
> -- 
> 2.7.4
> 


