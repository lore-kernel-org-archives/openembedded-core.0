Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3Z1v-0006zt-84
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 22:29:16 +0100
Received: by mail-vc0-f172.google.com with SMTP id l6so1986645vcl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2013 13:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Z9/1zyPtjgLhhIV/xh3RC+wx6QcfvBduDTMO6qqkpW0=;
	b=faE3UuZMoMyDlxCR9uDbSeFBZVh6N1RDIBeDAKA7CqZ+LufZDttowHsWxVNH6Y3oLD
	AGM6/ue3+DGETvqYT1JRt9ay7+i2DnLYimhJqr2IvgQFVxQAVhPEFDh7LYCMSC+VKBws
	qd0ixaeY8dAQb6fDuIJLlcWH7UHVjQ3DprrmxTr2iWHkd3DHh/B3fs+81iytP1D+GMv9
	Wp2o5BhYLzM4RZJkPqAw0pQxhMRLabiJVLNUf3tSwQEg/apgAKNJW+x3hEywU5Pem+Sj
	J7Or5tKg+CDlYtylknJi/D9lGBDxScxaTAFVT12KpHaRIGQih6y6oLkPP87UiV6spVk6
	qWYw==
X-Received: by 10.220.116.5 with SMTP id k5mr2515596vcq.55.1360256211172; Thu,
	07 Feb 2013 08:56:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Thu, 7 Feb 2013 08:56:31 -0800 (PST)
In-Reply-To: <f651997fbd77a84e5c9c379898836cf4cb3340f1.1360165052.git.tom.zanussi@linux.intel.com>
References: <cover.1360165052.git.tom.zanussi@linux.intel.com>
	<f651997fbd77a84e5c9c379898836cf4cb3340f1.1360165052.git.tom.zanussi@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Feb 2013 16:56:31 +0000
Message-ID: <CAJTo0LZPDf_oHYp4O-8VsLXYxEvp=gBmhDq5zWpiX-RhUCLhgA@mail.gmail.com>
To: tom.zanussi@linux.intel.com
X-Gm-Message-State: ALoCoQn9MuwyqPZUkQOssMMUJhTCH4GI3uuKUNjrrdycqFTT9m3P8km6kSDyjEYkC3tmz3vnx8sM
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1][danny] crosstap: handle hyphenated x86_64 target arch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 21:29:18 -0000
Content-Type: text/plain; charset=UTF-8

On 6 February 2013 15:40,  <tom.zanussi@linux.intel.com> wrote:
> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>
> systemtap_target_arch() should also translate x86-64 (hyphenated) into
> x86_64 for the -a param.  Failing to do that causes systemtap to see
> an architecture mismatch and create a cloned session with a bogusly
> synthesized build directory path, and fails to compile the probe.
>
>  Fixes [YOCTO #3756]
>
> (From OE-Core rev: 98cae0544884cb5700d42409ec4a9584a17dc9a4)

Merged to danny-next.

Ross


