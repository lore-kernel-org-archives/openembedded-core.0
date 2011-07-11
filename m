Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QgKhA-0006A9-1V
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 19:55:00 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QgKdK-0005O1-CF from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 10:51:02 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 11 Jul 2011 10:51:01 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 11 Jul 2011 10:51:00 -0700
Message-ID: <4E1B37F1.2020504@mentor.com>
Date: Mon, 11 Jul 2011 10:50:41 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310405202.git.otavio@ossystems.com.br>
	<20c3ca693fdd81de50e817ff64ada90a4bf71ade.1310405202.git.otavio@ossystems.com.br>
In-Reply-To: <20c3ca693fdd81de50e817ff64ada90a4bf71ade.1310405202.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 11 Jul 2011 17:51:01.0523 (UTC)
	FILETIME=[18F53E30:01CC3FF3]
Subject: Re: [PATCH 5/5] cmake: update to 2.8.5 release
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
X-List-Received-Date: Mon, 11 Jul 2011 17:55:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/11/2011 10:27 AM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-devtools/cmake/cmake-native_2.8.5.bb |   11 +++--------
>  meta/recipes-devtools/cmake/cmake_2.8.5.bb        |   11 +++--------
>  2 files changed, 6 insertions(+), 16 deletions(-)

Since this also fixed a little license problem (older versions shipped
some unused Windows build fragments that were marked as proprietary)
we've noticed:

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


