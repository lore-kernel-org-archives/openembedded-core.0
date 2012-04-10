Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SHdiI-000863-UY
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 18:14:39 +0200
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 10 Apr 2012 09:04:15 -0700
Received: by dadz14 with SMTP id z14so22959021dad.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 09:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=ekoOu5wtf03a01e3q4ulsFx2b5IwSHJT9YvyyVYRZsA=;
	b=QrZe4YbdpOrzuZ5lXQBaw5X4BCYzar+GxREme/jyzhDbYM+a3sHaLMFbNih7qHo7f+
	ze5xMyRaML4fZ2CDzJM5NraVuN0M9MT55soBCkK+dI+ZwZhHzwS2giHnX+Ypvpc4mcr5
	gpMzs4HfIYrBkRPwK4ks+X2R3mQzSdRifh5eq3AEx5U0e7S9roxH8TLyCVoyQ760va26
	3D9X4r2uj5ABofVpHrRT24cFUR5GT6XZa4f7KMKfNRxEquSmYwMxRE1DzR7JI1bTGaX6
	c5nLXUsAolcGS71WSIaoLWyXyUYdgXWMjF8MGLRkAwpCooyU3M2Yz7K+iWQj5lSOxi+O
	WiAg==
Received: by 10.68.132.36 with SMTP id or4mr29691903pbb.115.1334073855012;
	Tue, 10 Apr 2012 09:04:15 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id l1sm215458pbe.54.2012.04.10.09.04.12
	(version=SSLv3 cipher=OTHER); Tue, 10 Apr 2012 09:04:13 -0700 (PDT)
Message-ID: <4F8459FB.7010900@intel.com>
Date: Tue, 10 Apr 2012 09:04:11 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <CAK18fxFb3xkxbiyCDBncgpyvqOVCgOvzViveLa=aw3CyQPKiQA@mail.gmail.com>
	<20120410152244.GA2852@deadlock.dhs.org>
	<CAK18fxHsg0974jsk9yicybcqgCVBuj_qDAbj9R3v1LMsu0S2pw@mail.gmail.com>
In-Reply-To: <CAK18fxHsg0974jsk9yicybcqgCVBuj_qDAbj9R3v1LMsu0S2pw@mail.gmail.com>
X-Gm-Message-State: ALoCoQkVvZX+iXwJwl3RSG4dq1mUMsrsEt97qFWOLyG2Vsu8utdboMsSZjVPJKKDCxmhn5oVGxKx
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: js 185 -> js186_1.0.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 16:14:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2012 09:02 AM, Andrei Gherzan wrote:
> Thank you very much for this clarification.
>
> @Saul, about upgrading js. This upgrade will break web, web-webkit and
> maybe more. How do you want to solve this issue? I compiled js180.
>
What kind of breakage?

If they need rebuilds then we bump PR to force that, but if it's API 
kind of breakage, then we need to understand that and if they are fixes 
for those update them also.

Sau!


> @g
>
>
> On Tue, Apr 10, 2012 at 18:22, Sergey 'Jin' Bostandzhyan
> <jin@mediatomb.cc> wrote:
>
>     Hi,
>
>     On Tue, Apr 10, 2012 at 06:14:58PM +0300, Andrei Gherzan wrote:
>      > Have a problem while updating js to version 185. This version
>     renames the
>      > library in libmozjs185. What to do in order to avoid breaking
>     packages which
>      > need libjs? Another interesting thing is that js is now called
>     js185_1.0.0
>      > which seems to be actually another package / implementation? I
>     will try to test
>      > this using symlinks while compiling web package.
>
>     JS 1.8.5 is not backwards compatible! This is the reason why they
>     renamed the
>     libs, you can not link older software against JS 1.8.5 without
>     adaptions, the
>     new version has a new API.
>
>     Kind regards,
>     Jin
>
>
>
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



