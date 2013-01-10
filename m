Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TtOsP-00012e-2r
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 21:37:25 +0100
Received: from mail-fa0-f71.google.com ([209.85.161.71])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 10 Jan 2013 12:22:09 -0800
Received: by mail-fa0-f71.google.com with SMTP id m1so971914fam.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 12:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=Bs8amLhyO3RsuO1m6cQXh1iPRwybQlkN6TGUIZr1dag=;
	b=EVtx/FvDIj4BTlZVLEwBdixT7XV3YWKdsw0LhDDv4WsdRCc8nAwwlwHiUPxuCdKyap
	tFYYqvbFESaeYPI2JXwNQVmEPCHBvYpyL1fCi33H/D0BgTMc6e2LOUZRtfLa5lFEVWPt
	h7EvUdnONy7T6Gvvm5t9XoeMLmNCKjpOAcl14VZWB+OCpnwHrZlvGj9x7hNtWUQlFTKu
	gkWLwO84iLQW9Oppt0ovQWPP4Rc6lJa1f19NHvLRHpEPZPENKDylRSAVQtRuxth5wN1U
	iPZB1E6gCpkYsKAMKFcuYBEzxtDBhe8t8IZ31qdHavBkixXYKuk1QauzO7gFRA6J36Cz
	yqww==
X-Received: by 10.14.205.198 with SMTP id j46mr195698969eeo.27.1357849324150; 
	Thu, 10 Jan 2013 12:22:04 -0800 (PST)
X-Received: by 10.14.205.198 with SMTP id j46mr195698931eeo.27.1357849323796; 
	Thu, 10 Jan 2013 12:22:03 -0800 (PST)
Received: from [192.168.1.7] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id v46sm5003161eep.1.2013.01.10.12.22.02
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 12:22:02 -0800 (PST)
Date: Thu, 10 Jan 2013 20:22:03 +0000
From: Ross Burton <ross.burton@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <65E2376D69F0422989FFE6F99DA14D8D@intel.com>
In-Reply-To: <50EF117F.4080000@linux.intel.com>
References: <1357843361-18125-1-git-send-email-cristian.iorga@intel.com>
	<50EF117F.4080000@linux.intel.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmjWkuOqQ4ntFqmw4GgKsk9HQtL3y8Uf7lwJwY14SIJF1rb8KS00re4itnh+AaYdseigEIaVnExMPUnojec5zuQPZzYR7e1YU+1tnK50L8YeZh4HI55NP9nsMNOTn+tQGtCt19t0VHNLRCCAuyqKqQA5xD85jqtn3HSHJdSrHvzZC2aH3PVIrhGSYELs5CEyK/X0KaY
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] connman: upgrade to 1.10
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
X-List-Received-Date: Thu, 10 Jan 2013 20:37:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday, 10 January 2013 at 19:07, Saul Wold wrote:
> I am not wild about us having to carry around the COPYING file for GPLv2
> as a "patch" file, is there any way use the existing copies we have in
> meta/files/common-licenses? I think that sysvinit-inittab uses the
> following:

It's also declaring GPL on what is effectively just "+NetworkInterfaceBlacklist = eth0".  If we don't ship the entire example configuration file but just the two lines that we need, copyright almost certainly doesn't exist anyway.

I'd prefer just shipping the fragment that we need.  We don't need all of the comments and examples on the device.

Ross


