Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C668C6014F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 14:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UE6ViP028967; Tue, 30 Aug 2016 15:06:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rBb5aJc83w_7; Tue, 30 Aug 2016 15:06:31 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UE6Rmr028963
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Aug 2016 15:06:28 +0100
Message-ID: <1472565987.29583.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Ed Bartosh
	<ed.bartosh@linux.intel.com>
Date: Tue, 30 Aug 2016 15:06:27 +0100
In-Reply-To: <CAP9ODKoB8emv-7Hb06+mS3tXwaWN4Zpekf0hyt02iu1x1ZpjnA@mail.gmail.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
	<CAP9ODKrOOs2ofhCzxdV0ZCULDCO9r2RgKZpcNxhH_fe56so0PA@mail.gmail.com>
	<20160830103536.GA3482@linux.intel.com>
	<CAP9ODKqrhofQDSL9zfhJC6HFKbk0bxnDhoaaqbn6ooj-0jqX8Q@mail.gmail.com>
	<20160830112159.GB3482@linux.intel.com>
	<CAP9ODKoB8emv-7Hb06+mS3tXwaWN4Zpekf0hyt02iu1x1ZpjnA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/18] Provide list of deployment artifacts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2016 14:08:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-08-30 at 10:36 -0300, Otavio Salvador wrote:
> On Tue, Aug 30, 2016 at 8:21 AM, Ed Bartosh <
> ed.bartosh@linux.intel.com> wrote:
> > > So it is always going to be skipped?
> > Yes it is for do_image_complete and do_populate_sdk tasks for now.
> 
> Oh ok.

Its a performance issue. I can see the attraction of putting these into
sstate however it would add significant time to the builds which many
people would find unacceptable.

Having manifests of deployed files is a huge win for a whole variety of
reasons and it standardises our output tasks. This compromise gives us
that without the performance hit of compressing everything into an
sstate artefact.

Cheers,

Richard



