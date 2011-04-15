Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QAouN-0006Iu-OZ
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 21:42:23 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QAosB-0007Sn-Fy from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 12:40:07 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 15 Apr 2011 12:37:11 -0700
Received: from [172.30.80.157] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Fri, 15 Apr 2011 12:40:06 -0700
Message-ID: <4DA89F12.7040205@mentor.com>
Date: Fri, 15 Apr 2011 12:40:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1302846043.git.ke.yu@intel.com>
	<38033f4ff7f7cd735acf7d2e11ba078f4c2aafb6.1302846043.git.ke.yu@intel.com>
In-Reply-To: <38033f4ff7f7cd735acf7d2e11ba078f4c2aafb6.1302846043.git.ke.yu@intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 15 Apr 2011 19:37:11.0584 (UTC)
	FILETIME=[83DF2A00:01CBFBA4]
Subject: Re: [PATCH 4/9] mesa: upgrade to 7.10.2
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
X-List-Received-Date: Fri, 15 Apr 2011 19:42:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/14/2011 10:44 PM, Yu Ke wrote:
> From: Yu Ke <ke.yu@intel.com>
> 
> - also remove the talloc-removal.patch because it is already
>   included in this version
> @@ -15,6 +14,6 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
>  DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"

While we're in here, the mesa stuff needs python-native as a DEPENDS.

-- 
Tom Rini
Mentor Graphics Corporation


