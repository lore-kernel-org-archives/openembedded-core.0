Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RQ7fv-0008KW-Cz
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 02:18:59 +0100
Received: (qmail 5159 invoked by uid 1003); 15 Nov 2011 01:12:34 -0000
Received: from unknown (HELO ?192.168.1.111?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	15 Nov 2011 01:12:34 -0000
Message-ID: <4EC1BC83.2010209@balister.org>
Date: Mon, 14 Nov 2011 20:12:35 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EC1A8A1.5010303@balister.org> <1321315894.26881.117.camel@ted>
In-Reply-To: <1321315894.26881.117.camel@ted>
X-Enigmail-Version: 1.1.2
Subject: Re: Build failure in samba
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
X-List-Received-Date: Tue, 15 Nov 2011 01:18:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Doesn't seem to help. Will look again tomorrow. Go to bed.

Philip

On 11/14/2011 07:11 PM, Richard Purdie wrote:
> On Mon, 2011-11-14 at 18:47 -0500, Philip Balister wrote:
>> Anyone have an idea about this failure building samba?
>>
>> http://pastebin.com/5PGX6MZr
>>
>> I'm going to look more tomorrow, just hoping someone sees something obvious.
> 
> Maybe this might help:
> 
> 
> commit ce064001e628597cab9c5713f1351e03478a4aa5
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Wed Nov 2 14:24:37 2011 +0000
> 
>     samba: Force python disabled for now to avoid host contamination
> 
> diff --git a/recipes-support/samba/samba_3.5.6.bb b/recipes-support/samba/samba_3.5.6.bb
> index d5945f9..a44ce02 100644
> --- a/recipes-support/samba/samba_3.5.6.bb
> +++ b/recipes-support/samba/samba_3.5.6.bb
> @@ -12,6 +12,7 @@ SRC_URI[sha256sum] = "466410868375d19a286ac3fc5d9f3c267ce359189f8e0d76e72ec10bd5
>  S = "${WORKDIR}/samba-${PV}/source3"
>  
>  EXTRA_OECONF += "\
> +	ac_cv_path_PYTHON=/not/exist \
>  	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
>  	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
>  	linux_getgrouplist_ok=no \
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


