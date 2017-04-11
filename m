Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 712DE77CD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491899237; x=1523435237;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=3yl9UZIKBkBRxWCj6tilj0/yWcXFj7oIG0SjOmlW3FE=;
	b=qF9UzOIhXz+8dy/1bOrJvJGTBAjpHOdOyN4+WP9e5rhj9n66OJhIxBk9
	c3AR28SO6Z9HCb2SuD3U+HgpCYsw8Q==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 01:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,184,1488873600"; d="scan'208";a="1154260719"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2017 01:27:15 -0700
To: openembedded-core@lists.openembedded.org
References: <1491897285-6179-1-git-send-email-dv@pseudoterminal.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8d9c24ce-6a90-e080-dbe9-b3edba59aac4@linux.intel.com>
Date: Tue, 11 Apr 2017 11:26:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491897285-6179-1-git-send-email-dv@pseudoterminal.org>
Subject: Re: [PATCH] kmscube: add recipe
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
X-List-Received-Date: Tue, 11 Apr 2017 08:27:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2017 10:54 AM, Carlos Rafael Giani wrote:
> This is a useful tool to test KMS and GBM-based EGL & OpenGL ES drawing

Sorry, but the bar for adding recipes to oe-core is higher than a single 
all-purpose word 'useful'. Useful to whom? What does the tool do? Is it 
essential for making an embedded system? You really should write a 
(much) longer commit message, for a start.

Alex


