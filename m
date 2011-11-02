Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLkFE-0003bF-Cb
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 00:29:20 +0100
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 02 Nov 2011 16:23:11 -0700
Received: by faan26 with SMTP id n26so947417faa.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 16:23:10 -0700 (PDT)
Received: by 10.223.91.68 with SMTP id l4mr11768124fam.16.1320276189955;
	Wed, 02 Nov 2011 16:23:09 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id a21sm8375484fao.18.2011.11.02.16.23.07
	(version=SSLv3 cipher=OTHER); Wed, 02 Nov 2011 16:23:09 -0700 (PDT)
Message-ID: <4EB1D0DA.10108@intel.com>
Date: Wed, 02 Nov 2011 16:23:06 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320183757.git.sgw@linux.intel.com>
	<5f42fbce6e383b6330efde454da2cfe0a38df5cf.1320183757.git.sgw@linux.intel.com>
	<CAP9ODKo+BrVout44UaDOLfk5mEz+dFA4qGvx3L-B6ZP0Bjakbg@mail.gmail.com>
In-Reply-To: <CAP9ODKo+BrVout44UaDOLfk5mEz+dFA4qGvx3L-B6ZP0Bjakbg@mail.gmail.com>
Subject: Re: [Pull v2 3/4] connman: create xuser
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
X-List-Received-Date: Wed, 02 Nov 2011 23:29:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2011 11:54 AM, Otavio Salvador wrote:
> On Tue, Nov 1, 2011 at 19:44, Saul Wold<sgw@linux.intel.com>  wrote:
>> We create xuser here as a backup incase that xerver-nodm-init
>> is not on the system.
>
> This is wrong. If xserver-nodm-init (btw, there's a typo on the commit
> message) is not in the image user is suppose to know what he/she is
> doing so we shouldn't add users not required to make their life
> easier.
>

Otavio,

The situation is that when xserver-nodm-init is not installed or this is 
not a ROOTLESS_X, dbus still requires the xuser be available for 
connmand to run correctly.

Sau!



