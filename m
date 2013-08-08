Return-Path: <Valentin.Cobelea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id AB67A608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 07:55:57 +0000 (UTC)
Received: from localhost.enea.se (192.168.14.183) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Thu, 8 Aug 2013
	09:55:53 +0200
Message-ID: <52034F09.1090904@enea.com>
Date: Thu, 8 Aug 2013 10:55:53 +0300
From: Vali Cobelea <valentin.cobelea@enea.com>
Organization: ENEA
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [192.168.14.183]
Subject: GCC PARALLEL_MAKE changed
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
X-List-Received-Date: Thu, 08 Aug 2013 07:55:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

We noticed that the GCC parallel make flag (PARALLEL_MAKE, located in 
"meta/recipes-devtools/gcc/gcc-cross-canadian_4.?.bb") got changed from 
"-j 32" to simply nothing.
We are wondering what was the reason for this change, which seems to 
have been made somewhere before the fall of 2012, while the GCC was 
around version 4.6 or earlier (for each we dont have the repository to 
track down the change).

After several builds where the compile time for GCC got measured, I can 
say that this flag indeed reduces the build time, when it is put at "-j 
32" (using a proper build machine).
In average the build time frame was reduced by 18%.

Much appreciated any thoughts on this, I know that it has been a while 
since this change happen.

Thank you very much,
Vali

