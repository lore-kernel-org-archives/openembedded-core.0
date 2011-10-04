Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RB7eG-00082y-7g
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 18:15:16 +0200
Received: by qadc1 with SMTP id c1so472478qad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 09:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=foFlaUWgw5ICdyoZti1KzcN+G6qT3tSmqH5BPzEfpJA=;
	b=Sv3Ts9o0fCdwoDa1mdiBT763+RbWiSiNAEDJ8xQ97/CGfeLo6iCNjPm/9EpehBstoy
	LRXaRLQuYKoZgrGatx+SHs1+QPF1NwTESro65DZAUe7pq75PJ8T+MlG2ARI6dypd40xk
	WQKXW4OAG/5iSjU2nhNJbYZXBKrzUkuPmXhOY=
Received: by 10.68.15.34 with SMTP id u2mr10637345pbc.59.1317744582134;
	Tue, 04 Oct 2011 09:09:42 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net.
	[99.57.141.118])
	by mx.google.com with ESMTPS id i3sm66272853pbg.10.2011.10.04.09.09.40
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 09:09:40 -0700 (PDT)
Message-ID: <4E8B2FC1.30902@gmail.com>
Date: Tue, 04 Oct 2011 09:09:37 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317731939.14671.36.camel@ted>
In-Reply-To: <1317731939.14671.36.camel@ted>
Subject: Re: autotools.bbclass: Allow dependency tracking option to be easily overridden
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
X-List-Received-Date: Tue, 04 Oct 2011 16:15:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/2011 5:38 AM, Richard Purdie wrote:
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index ff27842..a4ce851 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -64,8 +64,10 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
>   		  --infodir=${infodir} \
>   		  --mandir=${mandir} \
>   		  --disable-silent-rules \
> -		  --disable-dependency-tracking \
> +		  ${CONFIGUREOPT_DEPTRACK} \
>   		  ${@append_libtool_sysroot(d)}"
> +CONFIGUREOPT_DEPTRACK = "--disable-dependency-tracking"
> +
>

I think this would need to be documented somewhere as well.

>   oe_runconf () {
>   	if [ -x ${S}/configure ] ; then
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



