Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyKYe-0005YU-5y
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 12:01:24 +0100
Received: from mail-vb0-f70.google.com ([209.85.212.70])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 02:45:49 -0800
Received: by mail-vb0-f70.google.com with SMTP id s24so11362523vbi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 02:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=aTVK76qeY2+/a7aliSAS8KUktmPwv/z8RVMEI69eESM=;
	b=io7TVz6NyazJwvBQ0ink/z7Fh1AQlUor0q/e6G9a527LoI/MvNGh6UDNtwSz4rLFXn
	sST51RxKSGOq+tPpjlUAPUmut8sGxrO+NXwpF+pz4YzdwG/PDsdWu2tafT0zEWNQV79f
	mxTPZa9bzpIYf5NjHu43Ulq5rAMGxYBi3ICfX0DOaHSYZ+hs26Wgdd5YlDbIGJzHsySW
	DABhs5Gz5JlqT5V4++PkTOTLUTZbitgk685yiW4TVVudqRxj8nybmQA461mcyWX2R7FS
	JXRMRUe7UyriPIhTy59KSfwktjpe6BhazrGeafkOpvifX7cNQlstl1gABOgrzZg6q1Ou
	ZH8w==
X-Received: by 10.220.154.76 with SMTP id n12mr1299710vcw.69.1359024348623;
	Thu, 24 Jan 2013 02:45:48 -0800 (PST)
X-Received: by 10.220.154.76 with SMTP id n12mr1299705vcw.69.1359024348562;
	Thu, 24 Jan 2013 02:45:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Thu, 24 Jan 2013 02:45:27 -0800 (PST)
In-Reply-To: <dc49f51db3966ad18b51e6c8c10ee792db58bbc0.1359014474.git.Qi.Chen@windriver.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<dc49f51db3966ad18b51e6c8c10ee792db58bbc0.1359014474.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 10:45:27 +0000
Message-ID: <CAJTo0LYpPTLBFczuC-QiPNm7W5u5nwQHf48SO5BKB5S+nHjHUA@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQl7uz1OJgSJBCA8asI1M/PEcAPI/er17nFhZEdAHLhyHjVEFYPIgRA1KdD2SgcMwMl0C/oUvaPAExasZ2hsCXmfZhvV/ndYrf1OwoHzwHHdKhpSYuLLtIvoBgIPGGn2D42iYrZezf7GnjTTA/HzY3zi7Oul4CGDfExNAkspleAa9Wjk+zbjq+0YsmRtHqzZpQAhhhSQ
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/12] dbus: inherit volatiles to support read-only rootfs
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
X-List-Received-Date: Thu, 24 Jan 2013 11:01:24 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 08:16,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Inherit volatiles.bbclass to support read-only rootfs.

Please explain why DBus needs volatiles.bbclass to support a readonly
rootfs.  Presumably it's because the machine UUID is written to
/var/lib, are there any other reasons?

Ross


