Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC705771BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 07:34:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w567XxHw015809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2018 00:34:41 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 6 Jun 2018 00:34:35 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1525768293.git.Qi.Chen@windriver.com>
	<1e0c9af91ddb0503b3c02df77a6fd71cba12bab2.1525768293.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <6c3055b5-7568-ca93-c45c-75976e590553@windriver.com>
Date: Wed, 6 Jun 2018 15:37:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1e0c9af91ddb0503b3c02df77a6fd71cba12bab2.1525768293.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/1] create-pull-request: handle '/' in subject correctly
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
X-List-Received-Date: Wed, 06 Jun 2018 07:34:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 05/08/2018 04:34 PM, Chen Qi wrote:
> When subject contains '/', we will meet the following error when
> using create-pull-request.
>
>    sed: -e expression #1, char 59: unknown option to `s'
>
> The problem is not critical. But it's better to fix it.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   scripts/create-pull-request | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index 280880b..b4cf706 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -278,6 +278,7 @@ fi
>   
>   # Replace the SUBJECT token with it.
>   if [ -n "$SUBJECT" ]; then
> +	SUBJECT="`echo $SUBJECT | sed -e 's#/#\\\\/#g'`"
>   	sed -i -e "s/\*\*\* SUBJECT HERE \*\*\*/$SUBJECT/" "$CL"
>   fi
>   



