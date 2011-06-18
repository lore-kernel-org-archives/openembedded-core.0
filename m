Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QY5CM-00051X-7I
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Jun 2011 01:45:37 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QY58v-00001Z-Hq from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 16:41:33 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 18 Jun 2011 16:36:33 -0700
Received: from [172.30.80.132] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Sat, 18 Jun 2011 16:41:32 -0700
Message-ID: <4DFD379B.8010701@mentor.com>
Date: Sat, 18 Jun 2011 16:41:15 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <BANLkTin20ZXvBnT9phab1KZcZ1iCkO8RaQ@mail.gmail.com>
In-Reply-To: <BANLkTin20ZXvBnT9phab1KZcZ1iCkO8RaQ@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 18 Jun 2011 23:36:33.0329 (UTC)
	FILETIME=[8E938A10:01CC2E10]
Subject: Re: BUG: intltool depends on libxml-parser-perl to be	installed on host
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
X-List-Received-Date: Sat, 18 Jun 2011 23:45:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/18/2011 01:18 PM, Otavio Salvador wrote:
> Hello,
> 
> It seems that intltool depends on libxml-parser-perl being installed
> into host system to it to build.

Do the DEPENDS look right?  Maybe this needs the class for bringing in
perl-native...

-- 
Tom Rini
Mentor Graphics Corporation


