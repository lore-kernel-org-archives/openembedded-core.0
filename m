Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C44F26B6BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 16:07:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1KG775l011877; Thu, 20 Feb 2014 16:07:07 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9JtcGUj6s1is; Thu, 20 Feb 2014 16:07:07 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1KG71he011873
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 20 Feb 2014 16:07:03 GMT
Message-ID: <1392912414.1560.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Thu, 20 Feb 2014 16:06:54 +0000
In-Reply-To: <CAJ2CSBtk4okj2Pn9-qcB-kQ+jBAMU53sxxvYyH9YXL43Go-Pxw@mail.gmail.com>
References: <1392658389-19826-1-git-send-email-alexandru.damian@intel.com>
	<1392906622.1560.1.camel@ted>
	<CAJ2CSBtk4okj2Pn9-qcB-kQ+jBAMU53sxxvYyH9YXL43Go-Pxw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sstate: list missing files for toaster
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
X-List-Received-Date: Thu, 20 Feb 2014 16:07:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-02-20 at 15:41 +0000, Damian, Alexandru wrote:
> I would think against it, because

> - it's very inefficient to send a Skipped event for each missed task
> than to collect all the data and send it in one shot
> - it's faster to send the event from the sstate.bbclass than to return
> the task ids and then call again a python function to generate the
> sstate file names - basically replicating the sstate.bbclass code in
> bitbake
> - the queueTaskSkipped event has a different semantic than what we
> need here to return a whole batch of data; creating a new event type
> from scratch is a bit pointless since the inheritance would need to be
> broken
> - knotty can receive MetadataEvents just as well as sceneTaskSkipped
> event, or any variation of it

I guess I'd like to understand which information from this even you're
particularly interested in?

Do I understand correctly that you want the actual filenames attempted?

Cheers,

Richard



