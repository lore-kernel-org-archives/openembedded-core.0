Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeF3P-00058z-8A
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 02:33:51 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 17:23:15 -0700
Received: by pbbro8 with SMTP id ro8so4390pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 17:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=3EZdn3VMA8PjdkJSV6ToxKzhqvqK3Vnxy+wX8giaI08=;
	b=Av+RLrlFDTELuzF8pTv4h4k0Rvgstm0UfbKANp66CDsWA8wAeDzoFy2EIDexpJj1Oc
	m+iD8wkh9V5N75Xg0FPC0+2zEqCpATrkk23W9D/LXieZ7CrIdeujIIQBMYf/ofQnbHFr
	jMPR+aYDl6OArSck/YyLT3xz5f+MIQUbmybBjC+1NARJfUME0oPR7iXryPKqW5YUR/it
	BQ8IFCSg7+ZZPD/CQwDVxeB/X/XKIT2GHHCHHOb85zsLLHc/4stv+v9I/kVGyzEXa9mu
	B/PEIbJJ5x1BFYkwBaw33Qmco/vyROKDtUXEJp0LgieN/JmBeQow1cSWpE9KvrkiiSvn
	flTA==
Received: by 10.68.223.35 with SMTP id qr3mr32997955pbc.83.1339460595425;
	Mon, 11 Jun 2012 17:23:15 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id rv5sm20134971pbc.56.2012.06.11.17.23.13
	(version=SSLv3 cipher=OTHER); Mon, 11 Jun 2012 17:23:14 -0700 (PDT)
Message-ID: <4FD68BF8.9030607@intel.com>
Date: Mon, 11 Jun 2012 17:23:20 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1338658338.git.otavio@ossystems.com.br>
	<5bbd09a3f268bff3c7f1126e6d88bb61aeccbb2f.1338658339.git.otavio@ossystems.com.br>
	<CAPhnLPDP65iKqruiLLE2UmmEZsR7LOKeUNMGHVitwKp54dHWRg@mail.gmail.com>
In-Reply-To: <CAPhnLPDP65iKqruiLLE2UmmEZsR7LOKeUNMGHVitwKp54dHWRg@mail.gmail.com>
X-Gm-Message-State: ALoCoQmPskYsxFUxtzt3OAEhI3Y8IiykPPjZDcxhukItz8eczxLz0kSoDroc2o3Z+9hQNLV/2ZlN
Subject: Re: [PATCH 1/1] openjade: autoreconf to fix building on newer host systems
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
X-List-Received-Date: Tue, 12 Jun 2012 00:33:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2012 10:34 AM, Flanagan, Elizabeth wrote:
> On Sat, Jun 2, 2012 at 10:34 AM, Otavio Salvador
> <otavio@ossystems.com.br>  wrote:
>> When using an update host system the build environment fails to
>> properly get config.h done. To solve it we update the build system
>> thought use of autoreconf. The build failure was:
>>
>> ,----
>> | ...
>> | DssslApp.cxx:117:36: error: 'PACKAGE' was not declared in this scope
>> | DssslApp.cxx:118:36: error: 'VERSION' was not declared in this scope
>> | make[2]: *** [DssslApp.lo] Error 1
>> `----
>>
>> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
>> ---
>
> Merged into OE-Core

I don't see this commit in oe-core master?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


