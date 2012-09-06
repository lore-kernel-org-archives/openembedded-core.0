Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9iB6-0004Nn-PZ
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 21:55:52 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 06 Sep 2012 12:43:14 -0700
Received: by obblz20 with SMTP id lz20so3442239obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 12:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=O3FlpcFtNjO+E+9dZr6NGpZIxcwUbSKNRV5EoOIN8O8=;
	b=jnVWNnuDI0h9VKWgefEHVK9nbcPzxQYwfPp1aDC3JE/2SfsfaL3tmQuDGCnnnx2BT/
	RwnwA/Z3RUJTq+2/8K7qE0lyWZslhOPKNMEMDKhbHMjuSMerS+xLL/1JG66rsKbZ/nZ5
	YCTxvx6iF6ry1AA5oZK03RCyNafBInTDOfVQK5zfc/jhZ7lTb4gHzxEVjqk8agz5tQcp
	O0obzvVQyq7F372LLSK307rH+pqSPJY48H03TqRDQLBFUnt/dokTto4GqCJmFY2KR7c5
	cfYeHqeg1/2Ci9JLxZNt627/pAxxqMZrz9Dn4OzLyM47sUgqMY83rc9lyksJiFVWiKXH
	WNwQ==
Received: by 10.182.43.40 with SMTP id t8mr3560235obl.93.1346960599142; Thu,
	06 Sep 2012 12:43:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 6 Sep 2012 12:42:59 -0700 (PDT)
In-Reply-To: <5048F1E3.4050800@linux.intel.com>
References: <1346945375-5770-1-git-send-email-ross.burton@intel.com>
	<5048F1E3.4050800@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Sep 2012 20:42:59 +0100
Message-ID: <CAJTo0LZMvGr8seDqpTgeOahjQDgN83RJU7n+hifyP0UHiRtRyw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQnBcZziV2wg8e5jXtKixkYyI9DCdRl10r6dB6qweORpYSDYs8Eou91SgikYBC9xySyJWOd1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins-good: disable (uninstalled) examples
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
X-List-Received-Date: Thu, 06 Sep 2012 19:55:53 -0000
Content-Type: text/plain; charset=UTF-8

Hi Saul,

On 6 September 2012 19:56, Saul Wold <sgw@linux.intel.com> wrote:
>You seem to be changing DEPENDS here also with no reason why.

From the commit log:

"The examples pull in a GTK+ build dependency, so remove that too."

Ross


