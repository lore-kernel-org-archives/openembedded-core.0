Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2m7T-0006LE-Ir
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:15:43 +0100
Received: from mail-pa0-f69.google.com ([209.85.220.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Feb 2013 08:59:52 -0800
Received: by mail-pa0-f69.google.com with SMTP id kq12so366146pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 08:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=yF3vR4awwDjGopvHYMahXsaVBDxsexxpFh2UdEQZ4BE=;
	b=XI6GHx5yepsxjtlcxuVR2VAIMhxUlIzKNjd5yhnQG+XutngXQVzeze544AhVVJK5mL
	FtOaIMzKJdbjV/JF5sK7bFfAlcRWnbbxpv6DYws8hjxs09QsGLXUvizYvWAWirIxlwAP
	uJQrWnHIaE4JKhC0b+5NJGn2wsLCfR3XacL8ZHEPisZ+FYlD5NTaWzXnZHKn2Y9MzDQ5
	JsoodOBH6zK9JCYtpHwj2lRmvRXBfkCaoU7pbrlwjZJCbyTuDTrwUIyWv4tffXzTA/xl
	HqsCTWgKDsRL4FcwhC8mYxervu09Jx6ZTxK4VL5r1KJ3JWDKbnzyxGHGYq6tOaTCiAk2
	Xqlw==
X-Received: by 10.66.77.201 with SMTP id u9mr66068243paw.80.1360083588076;
	Tue, 05 Feb 2013 08:59:48 -0800 (PST)
X-Received: by 10.66.77.201 with SMTP id u9mr66068218paw.80.1360083587848;
	Tue, 05 Feb 2013 08:59:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.193.225 with HTTP; Tue, 5 Feb 2013 08:59:27 -0800 (PST)
In-Reply-To: <CAC1BbcQss0BHe_CGx+H_QKbASNS-_4Bad8rHeCNdJERg-G8Y4w@mail.gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
	<CAJTo0LYDkCvZUCp4U4o_2bsmuiVor69Wbh4Rd94g3WvQ4=X5Yw@mail.gmail.com>
	<CAC1BbcQss0BHe_CGx+H_QKbASNS-_4Bad8rHeCNdJERg-G8Y4w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Feb 2013 16:59:27 +0000
Message-ID: <CAJTo0LZh=XEoK7DYJqNy8OCthYMRd=+5gLjPMR3Aj8DX6R-76Q@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-Gm-Message-State: ALoCoQlDeBXxrPIh6YpqTVVSMdwtS+TRqrKp0N/jSvwqhwzRb6ySdZGIJbwmKy9xB5+ACTmDUpw/Z9xF8+6cWyoGr/IVKPTx5nRZWVaESQAWN1skTBPySx7FSYp/z27XUhSt1c+VkLgRZN9tRsAwEI6IdjNZeq6gNH8H5sKooSm/nIWcTZzalGuGWdFjviP3GCKSlkXYT5Jh
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] Revert "Add ptest for glib."
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
X-List-Received-Date: Tue, 05 Feb 2013 17:15:44 -0000
Content-Type: text/plain; charset=UTF-8

On 5 February 2013 16:47, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> I do not have time to look into this, sorry. But yes, of course fixing
> it for real would be better..

Sharing the log of the failure would help immensely.

Ross


