Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D9F056E60D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:24:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t131Oo6e022895
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:24:50 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:24:49 -0800
Message-ID: <54D02360.3040903@windriver.com>
Date: Tue, 3 Feb 2015 09:24:48 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1422926504.git.liezhi.yang@windriver.com>
	<a0891364184e121af5992a984e08440c4ce3c46b.1422926504.git.liezhi.yang@windriver.com>
In-Reply-To: <a0891364184e121af5992a984e08440c4ce3c46b.1422926504.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 3/3] binconfig-disabled.bbclass: fix echo command
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
X-List-Received-Date: Tue, 03 Feb 2015 01:24:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/03/2015 09:22 AM, Robert Yang wrote:
> The ">" should be ">>".
>
> We had got something like the following in pcap-config:
> echo '--should-not-have-used-/usr/bin/pcap-config'
> exit 1
>
> (Lacks of #!/bin/sh)
>
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20150202

Sorry, the (LOCAL: xxx) should not be here, I've updated in the repo.

// Robert

>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/binconfig-disabled.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/binconfig-disabled.bbclass b/meta/classes/binconfig-disabled.bbclass
> index 0acc964..595cd09 100644
> --- a/meta/classes/binconfig-disabled.bbclass
> +++ b/meta/classes/binconfig-disabled.bbclass
> @@ -12,7 +12,7 @@ do_install_append () {
>   		echo "#!/bin/sh" > ${D}$x
>   		# Make the disabled script emit invalid parameters for those configure
>   		# scripts which call it without checking the return code.
> -		echo "echo '--should-not-have-used-$x'" > ${D}$x
> +		echo "echo '--should-not-have-used-$x'" >> ${D}$x
>   		echo "exit 1" >> ${D}$x
>   	done
>   }
>

