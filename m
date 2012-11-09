Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TWlqA-0006yj-NC
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Nov 2012 11:29:34 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 09 Nov 2012 02:15:44 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so11738588oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2012 02:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=RVJ+xoxhA1ycdkdN3o+IacUiNGiH6E5uGKyhbc3wZrs=;
	b=N9qDhWs940sPojM7UjFGlNthfHILtzg2ST+WrYfw8ddhrHzfjHTL2IgHs1Y/wxho+D
	S641dQC4bNiFk/q1+KoWLekl4MpeTDaMo0wS+TrbStjNJNebILtxMtobIyZIjVAHRDMR
	bqICvVT1Xcr7JPXuCfhPelAdIgfzIlBUHWqlMjDZlTxbDr5Odiy2NPTu779RWCSdEpAN
	cyufghXI2QjcKsnFCAReSBjgZMRIZ+2nuVu8OoNBs8Sz84Kshskb9eDwLIjRP/dYfDWT
	ndOrPEXW6I1/bC1TUXARHd69G0NnHvmdiFikv6P+10TO48BUpwXV7MROvOIe72n61b11
	3/pw==
Received: by 10.182.78.228 with SMTP id e4mr8141281obx.77.1352456143527;
	Fri, 09 Nov 2012 02:15:43 -0800 (PST)
Received: by 10.182.78.228 with SMTP id e4mr8141271obx.77.1352456143367; Fri,
	09 Nov 2012 02:15:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Fri, 9 Nov 2012 02:15:23 -0800 (PST)
In-Reply-To: <1352455242-5171-1-git-send-email-constantinx.musca@intel.com>
References: <1352455242-5171-1-git-send-email-constantinx.musca@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Nov 2012 10:15:23 +0000
Message-ID: <CAJTo0LZE56zn8UeSZ8OHs_oCX2U+y=L+F+HD9Dm74JPZyp_Eow@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Gm-Message-State: ALoCoQnltP49hZ24op38bZzWkvDiUR66aMdHBLi0l62ShM9VCFM8J22M5lA9WtFFkPpJiISO3r1Krk7PDeOAmnU5Hmf1jK7fPxkbsnYVsd8EByguhZenVCYzWFUU0eEnV3T6wRHhHsZFkx1CzvKjarzB2NcHxosNkK9v04oeZvI6eb+CKw6+nip7DWqmgZWzmM20yy8kOhFp
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libxslt: upgrade to 1.1.27
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
X-List-Received-Date: Fri, 09 Nov 2012 10:29:34 -0000
Content-Type: text/plain; charset=UTF-8

On 9 November 2012 10:00, Constantin Musca <constantinx.musca@intel.com> wrote:
> --- a/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
> +++ b/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
> @@ -1,24 +1,24 @@
>  Upstream-Status: Inappropriate [configuration]

This doesn't look "inappropriate" or "configuration" but a genuine
build fix.  Has anyone approached upstream?

(I'm genuinely dismayed at the number of build fixes that get marked
as inappropriate when they are clearly genuine build fixes)

Ross


