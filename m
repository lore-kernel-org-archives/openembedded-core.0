Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQgv8-0006vJ-15
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 18:01:37 +0200
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 23 Oct 2012 08:48:06 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so11918266obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 08:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=LrmuYDtCyOPe4Gxj1jE/JvcYphYVXKGzOF5TGagsTGI=;
	b=e83k7FVdWPSArOk0Jp0ABLHdYdilzHf9koOBlHN6x8oqMPKKUGx2nzH9g3DmuLUHvQ
	eEeaHwPVUj6AZ8NKOpkYOB/1xLt6XgM9j3Wgu7BYCJg6+RjHVAPVJ6tUnMdGxONltPJS
	jjYPLfm33ERhu5XiXrhlWLkskW96QqDqJlXMkR2M1JFN9z5OLdvc3URmEHXjfOp+39eY
	CDh5Yj+/eOLypAuPntFwzIqP5HVGmKz/RZ3utbMYwOskZQgvqXN54Fs7DD9Eu9JeJZow
	32U9dPMDK7wUX5Q4XCggAesXyU0JdyT2Q6t/4TC55ctprBxOTEIz3yAzuhrH+pCtCFBN
	uJ+A==
Received: by 10.182.117.74 with SMTP id kc10mr10288389obb.63.1351007284932;
	Tue, 23 Oct 2012 08:48:04 -0700 (PDT)
Received: by 10.182.117.74 with SMTP id kc10mr10288384obb.63.1351007284856;
	Tue, 23 Oct 2012 08:48:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Tue, 23 Oct 2012 08:47:44 -0700 (PDT)
In-Reply-To: <5086BBB2.7070601@communistcode.co.uk>
References: <50869BDC.6050401@communistcode.co.uk>
	<CAJTo0LZHTGaVLnrYidOmLwvqB3Z+n9m5itr_4hA9krEPHihdsQ@mail.gmail.com>
	<5086B713.30708@communistcode.co.uk>
	<CAJTo0Lb0Fv=Hwhp88EUjurQO_Lnr319M-q_2Y6Js0fbzfO7Xfw@mail.gmail.com>
	<5086BBB2.7070601@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Oct 2012 16:47:44 +0100
Message-ID: <CAJTo0LZ0t1j=UpHAHR7Q=1FZ-LWGhT2TV0L+NPScEzEBmfd_Sg@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQk5UinRrJ3asZ36IYVNqg2vvuBnONTU8goiQKYRaTt4p56ZzzfBirDjy7b8uj6a+pj7Vg5RDxhsS8SZLbe+0CPrH4FzCY5TPBn8hX4DLRHqSLTDgTyiYUcz0jemUrcX7KHKyqVujLRtZxtph3D8xRdry1/QoeWfovz0C5EAz3RIc/VBMG3NfLiF5dVXPLg4Z33aG5ZI
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues building meta-toolchain, libxau
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
X-List-Received-Date: Tue, 23 Oct 2012 16:01:37 -0000
Content-Type: text/plain; charset=UTF-8

Gnnar.

Go into /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/
and grep it for libXau.la - need to find where it's coming from.

Ross


