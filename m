Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 808957198D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 15:42:28 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 04 Jan 2017 07:42:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,459,1477983600"; d="scan'208";a="49241265"
Received: from unknown (HELO [10.219.5.165]) ([10.219.5.165])
	by orsmga005.jf.intel.com with ESMTP; 04 Jan 2017 07:42:27 -0800
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1482930164-15721-8-git-send-email-markus.lehtonen@linux.intel.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <23139570-1257-66eb-482c-e2f438a11976@linux.intel.com>
Date: Wed, 4 Jan 2017 09:43:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1482930164-15721-8-git-send-email-markus.lehtonen@linux.intel.com>
Subject: Re: [PATCH 7/8] oeqa.utils.metadata: have layer name as an attribute in xml
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
X-List-Received-Date: Wed, 04 Jan 2017 15:42:28 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 28/12/16 07:02, Markus Lehtonen wrote:
> -def dict_to_XML(tag, dictionary):
> +def dict_to_XML(tag, dictionary, **kwargs):
>      """ Return XML element converting dicts recursively. """
>  
> -    elem = Element(tag)
> +    elem = Element(tag, **kwargs)
>      for key, val in dictionary.items():
> -        if isinstance(val, MutableMapping):
> +        if tag == 'layers':
> +            child = (dict_to_XML('layer', val, name=key))
> +        elif isinstance(val, MutableMapping):
>              child = (dict_to_XML(key, val))
>          else:
>              child = Element(key)

I was thinking that this function would be more generic, adding a
comparison to a tag name surely won't keep the function generic, is
there another way to implement this keeping this function generic enough?

