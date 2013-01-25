Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tyk9e-0005Ul-V8
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 15:21:20 +0100
Received: from mail-gg0-f197.google.com ([209.85.161.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 06:04:33 -0800
Received: by mail-gg0-f197.google.com with SMTP id k5so487022ggn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 06:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=W3mkXH8KCGgxD4+IrXzIlTmjQLgVbcdS39AB2WLH0jE=;
	b=UuRL9BbO5047qWdSDBc3NqGSvdRqoABwFR8nl4BSO9b/PPm+k6na9zKqUiTKMI6rWS
	enW3Dsh684rw3adH5OPWHdTdYgGQNH2lTCshBYnmUzVjUvj/3CHNXpVpBmKBdwLcFAxS
	ej3vcnQQU0U812ozg6zE+wydYEbMToyqXtMWeNEYC5UVM3gMBQry6RXtbuu7vevdVbNp
	QHHG7dcphn3ytXbnmDi28wO+AiM03tb+oCPpl5DV+0b5hkHT9bA/koFnpvOt5susCkhz
	jgENRzV99QkLE2heBU3DLz5VK8T392MjmdiGy5Qhy57BoNqcHynXio7z3eoAQR+oEsjw
	IqeQ==
X-Received: by 10.220.209.74 with SMTP id gf10mr6005492vcb.10.1359122740849;
	Fri, 25 Jan 2013 06:05:40 -0800 (PST)
X-Received: by 10.220.209.74 with SMTP id gf10mr6005487vcb.10.1359122740787;
	Fri, 25 Jan 2013 06:05:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Fri, 25 Jan 2013 06:05:20 -0800 (PST)
In-Reply-To: <5102491B.20603@windriver.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<c60b41bd635d38aa01ffdd5c6221fd1a9c34b68f.1359014474.git.Qi.Chen@windriver.com>
	<20130124103150.GA3012@jama> <1359027432.3616.7.camel@ted>
	<CAJTo0LY9sXyoe9=rgGtstf3umrA+XeLJ1bDbJkM9S9bsqpA=HQ@mail.gmail.com>
	<5102491B.20603@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 14:05:20 +0000
Message-ID: <CAJTo0La_6JU4zLkKYmKT2oe+0CMX6nTr7nxkDT5tb=ZMr9EQzA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Gm-Message-State: ALoCoQkcCifblsDiOLuoltYmSy+w4No49S0rheWEqdBgiMg+b35bTkoaB7E648ZsN33cWmk7CKefXc0H1N7nK7pOpXXV8MP2CmS/5Cq41wmq0N0ybbbVoo2fcG+bz9Zf/ud7lJrfweI99ZUR4feLoycNQTHdwxGSpsu1nBLbAXPeUuVYvUeuw2lEO1M/E5wRdbmig/wmWyte
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/12] volatiles.bbclass: add recipe
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
X-List-Received-Date: Fri, 25 Jan 2013 14:21:22 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2013 08:58, ChenQi <Qi.Chen@windriver.com> wrote:
> It seems that the backfill happens *before* this expression is parsed.

Yes, because of these two patches that I reviewed and submitted yesterday:

commit 4db8a3daafdedf39e081f4f6130f6cdcde03ed62
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Thu Jan 24 17:52:56 2013 +0000

    base: make feature backfilling happen earlier

commit c98363450fc4ccab82b34a37a95bd172cf6e115f
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Thu Jan 24 17:52:55 2013 +0000

    bitbake.conf: unbreak all builds with custom DISTRO_FEATURES

Ross


