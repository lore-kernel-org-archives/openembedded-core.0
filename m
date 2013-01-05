Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TrJuu-00034K-Ew
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 03:55:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r052eFHQ008567
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Jan 2013 18:40:15 -0800 (PST)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 4 Jan 2013 18:40:14 -0800
Message-ID: <50E7928C.9010300@windriver.com>
Date: Sat, 5 Jan 2013 10:40:12 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1355990839.git.hongxu.jia@windriver.com>
	<8bfee81d0404d9325ccaccb260cadad8269d92ae.1355990839.git.hongxu.jia@windriver.com>
	<CAJTo0LYrfbtkoO5WD+ckvm4s2xejxyAtjWhWyMfyaGPOGtTZnA@mail.gmail.com>
In-Reply-To: <CAJTo0LYrfbtkoO5WD+ckvm4s2xejxyAtjWhWyMfyaGPOGtTZnA@mail.gmail.com>
Cc: Saul Wold <saul.wold@intel.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib-2.0-native:add option march to BUILD_CFLAGS
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
X-List-Received-Date: Sat, 05 Jan 2013 02:55:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/2012 06:05 PM, Burton, Ross wrote:
> On 20 December 2012 08:10, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> +# Add option -march to BUILD_CFLAGS in order to let the atomic operations
>> +# ("lock free") be available while using old version GCC on x86 host to
>> +# compile glib-2.0-native
>> +BUILD_CFLAGS += "-march=`echo ${BUILD_ARCH} | sed 's/_/-/'`"
> Should we do this inside bitbake.conf instead of just in glib?
>
> Ross

This is only needed by glib-2.0-native, and didn't notice
this error for other recipes, so I just added it for glib-2.0-native.

Hongxu


