Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyjJV-0000uL-Nc
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 14:27:39 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 05:11:50 -0800
Received: by mail-vc0-f197.google.com with SMTP id gb30so429425vcb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 05:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=q6AfTnSmGVq6vKED2/HLTkufvQPrVAmQ176SlrfT6PM=;
	b=ah2HgpSfrVxsR6En+DKXhpJ5r7lRnzeFAX5OE+tsoeTLmEHy6HkxhXH75DpXIgvJlU
	tSPmATFZ32IR3rHcLOd7Z3kDTQcYFHpHAaxHYTNhWNDMCj0frPCrgtRhH24Ox8rjFP4y
	NwEI5uKEsHjnmtMmf59gU7u03TQQlzNp9MmiF/aY3XuTDRO7VfsEuN06l0b0ZNdHsFuE
	VuDYnz7XuANHjqACQ1BxIJ2NbafUwfOVzL7w6fHD5X6tXs3V3mNg+2XsEApaq0GIY0/6
	5548CfIGU6m4yYp+jJKOzZsrsbJq5GTFDToAKJ1QO5go9BIclQ1t0pSvlg8unrKBXPR+
	cvAQ==
X-Received: by 10.220.239.14 with SMTP id ku14mr5729373vcb.57.1359119509246;
	Fri, 25 Jan 2013 05:11:49 -0800 (PST)
X-Received: by 10.220.239.14 with SMTP id ku14mr5729366vcb.57.1359119509165;
	Fri, 25 Jan 2013 05:11:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Fri, 25 Jan 2013 05:11:29 -0800 (PST)
In-Reply-To: <680bfa5f6dd8d3a3e77a18240caab373f03b8006.1359014474.git.Qi.Chen@windriver.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<680bfa5f6dd8d3a3e77a18240caab373f03b8006.1359014474.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 13:11:29 +0000
Message-ID: <CAJTo0LbOHCMpEFwCX7i5X1xqEe9FkkssvQUk6beDTLYZwc3gWA@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQkfBmCDglQCOAxaqWiBOas1Op7PIG0dht5rS7Pcjk62KGmuANja7GMRugmDGb495/P0G47Jy3CWTcISGK207HSIomPpeuNtNRgQDsdd9R4gUqKQDCbK8FU0u7gF64tFHlAGYSDtDMKRur9RaaIbLlr/ZxrxcHYw6TR7arjeiImjVwqEyHiG5BD+k6xXJdfII00khnMN
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/12] initscripts: inherit volatiles to support read-only rootfs
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
X-List-Received-Date: Fri, 25 Jan 2013 13:27:39 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 08:16,  <Qi.Chen@windriver.com> wrote:
> +VOLATILE_DIR = "/var/volatile/lib/urandom"
> +VOLATILE_LINK = "/var/lib/urandom"

A better solution would be to not attempt to save and restore a seed
value that is intended to persist across reboots when it's on a tmpfs.
 Putting the urandom seed into tmpfs is just a waste of time.

Ross


