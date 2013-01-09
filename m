Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TssQB-00035N-0d
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:58:08 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 01:42:53 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so1319693bkc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 01:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=DYS/Pf1aGdLlUCJ5XDNnfLLkjj0Bo7PHVybST+S0t6k=;
	b=OEoC7hTx6OsZ2X/UJ/aNXFI42ZCrWyWUc5l+gXri4phhbyQy46lt/jlN/8/X9zna/J
	BPHdXWe6T6BMKSIpII3rFbBZBQQC87gdJohmyqm0bzotn++BOVbcqG+SVq/FXiZ7dPhS
	Cg86jt+ckTPSYBG8FUsFvWMsGr+8ijBjpphEF0bLCT/zQLRnMbt/XAz31BUjvo+hAHN1
	UYhDhIzPuk+r/+9KSmoXXsVvDdK2fqit35iLnJo9z4HWQxExW8cZoT5zbo5ZhOI+ZTiS
	bKp3ZVeawtobRaSDei7xKUZ6Vt44yDnSPKC4xwHGxft67S44YVv/UejN3oPb+gg7Abau
	rs2g==
X-Received: by 10.204.131.78 with SMTP id w14mr34266177bks.83.1357724571419;
	Wed, 09 Jan 2013 01:42:51 -0800 (PST)
X-Received: by 10.204.131.78 with SMTP id w14mr34266172bks.83.1357724571224;
	Wed, 09 Jan 2013 01:42:51 -0800 (PST)
Received: from [192.168.1.13] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id m20sm47902794bkw.4.2013.01.09.01.42.49
	(version=SSLv3 cipher=OTHER); Wed, 09 Jan 2013 01:42:50 -0800 (PST)
Date: Wed, 9 Jan 2013 09:42:53 +0000
From: Ross Burton <ross.burton@intel.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Message-ID: <388BD596D68348D5A465A83C5E148D40@intel.com>
In-Reply-To: <CAF6bG8dULrN_qQZWjvM2mJgQbyn0UvqzhcjV7e6Rzfj3h9GX4g@mail.gmail.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
	<50E8FDBB.5080500@linux.intel.com>
	<CAF6bG8fBgAP_No6RkckjvEQ2XquwKagbyn-Rh01CY7Hi+8MfFw@mail.gmail.com>
	<CAF6bG8cuLp7nGzKUZscUrRoa1Z5_mrSduvWQ4r4YbvtZx2rFdg@mail.gmail.com>
	<20130109091303.GC3722@jama.palm1.palmone.com>
	<CAF6bG8dULrN_qQZWjvM2mJgQbyn0UvqzhcjV7e6Rzfj3h9GX4g@mail.gmail.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmBYVBbb52JfAS5mxs9vUXTeD0jQrzkZr5LGjhhRTr2gLdZMo9rn6MphyZ6oTh4PtXJTFxNWp67J7+cVVvIXQGyyoXny8vVBh+V5S1l/rmbaGWp2upuBI+J8BC04Vtj5VYBqQ3LmQ9AgKyewBz2G0W9NdW2b7FGj/M1EF5pv9rlZnXir8LKz3QKaNQ1CKUIqOsVVHGB
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
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
X-List-Received-Date: Wed, 09 Jan 2013 09:58:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday, 9 January 2013 at 09:33, Marko Lindqvist wrote:
> Exactly, except that it would be provided by bitbake, and not
> constructed by each recipe itself - less recipe writing work + you
> could count on it to always mean same thing.

Everything but the last dot, or the first two components, or what?  For anything GNOMEy you want the first two elements as some packages use nano releases for development snapshots (1.2.3.4).

Ross 




