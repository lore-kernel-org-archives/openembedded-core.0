Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TdySl-00060j-NX
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 08:23:11 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 23:08:54 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so8464648bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 23:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=2CSU0d3ek/X/HvL8fqxhClwn9HcFzG1p/B+524cNrAE=;
	b=dl9MInNwDre/YQ49QM6hp2l6dSC3mlmx0ifv+WyhMSy6MqdCLp0bDkQ+yT/yseqde3
	J2/zUtAVoVb7Z5OJtkYIN4jqp0scW4zhBhuXwTBnnKi86Yh0XJwt8Ev1C3AaWSJDqZL2
	3x7r3j8Vk2ep8Gtrj1JncQJ+N3YIuBBG1Pvv1XtwHlEWfaf8CjYEPm603+V9ExJGIRLS
	r+NSg+N/vLhapiQUI6Rx6kh5SJI+7sbBqaCP4zAoy5rB68yDqTp/1Ajy1P54F/Wrbi8b
	24yCxsG8gs6iGFGGwVGTzaeFo/hcysTP9h0z2vBH4KSNxWbSLRDx7f2d03Sb+Xiaa7Rs
	8lLQ==
Received: by 10.216.29.211 with SMTP id i61mr8324402wea.175.1354172931582;
	Wed, 28 Nov 2012 23:08:51 -0800 (PST)
Received: by 10.216.29.211 with SMTP id i61mr8324397wea.175.1354172931455;
	Wed, 28 Nov 2012 23:08:51 -0800 (PST)
Received: from [192.168.1.6] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id d9sm10313285wiw.0.2012.11.28.23.08.48
	(version=SSLv3 cipher=OTHER); Wed, 28 Nov 2012 23:08:49 -0800 (PST)
Date: Thu, 29 Nov 2012 07:08:49 +0000
From: Ross Burton <ross.burton@intel.com>
To: rongqing.li@windriver.com
Message-ID: <8CEBF7D0731E4F6A92279327C7C8C74D@intel.com>
In-Reply-To: <cb54673a133a17e2be78912491a696de62c6e431.1354170824.git.rongqing.li@windriver.com>
References: <cover.1354170824.git.rongqing.li@windriver.com>
	<cb54673a133a17e2be78912491a696de62c6e431.1354170824.git.rongqing.li@windriver.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnIIxDg7BCGyyWu0aer1rnLQSqB/YDY9w/hPXYWEn7qm4oTfn1qHig9PS9molOoPSO9UsCam3odAackuWR4l9qJqTcbvpMwv5pNerF+NsqYtgVALyHhViOFjOT7UKRL+mmTxts63wrZITA16pZWOagzpePZiyMXsJjMkYW/hdTrTQuhn1MNxXAZGc7Azi0B4d4pQvlP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] apr: set flag of inheriting O_NONBLOCK as no
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
X-List-Received-Date: Thu, 29 Nov 2012 07:23:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday, 29 November 2012 at 06:36, rongqing.li@windriver.com wrote:
> The flag ac_cv_o_nonblock_inherited is always set to yes in cross compiling
> environment. This flag is intended to think the socket, returned from
> accept(), inherit file status flags such as O_NONBLOCK from the listening
> socket, but socket never inherits file status from the listening socket on
> Linux (more information to man accept).

meta/site/powerpc32-linux already sets this to no, so if this Linux-wide behaviour it should be moved to site/common-linux instead of being specific to apr.

Ross


