Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1F870232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 07:58:19 +0000 (UTC)
Received: from [216.82.241.132:52649] by server-2.bemta-8.messagelabs.com id
	F2/00-11229-B99E3A35; Fri, 20 Jun 2014 07:58:19 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-13.tower-45.messagelabs.com!1403251099!38258679!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4938 invoked from network); 20 Jun 2014 07:58:19 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-13.tower-45.messagelabs.com with RC4-SHA encrypted SMTP;
	20 Jun 2014 07:58:19 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Fri, 20 Jun 2014 02:58:18 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.342.0; Fri, 20 Jun 2014 02:58:18 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Fri, 20 Jun 2014 09:58:16 +0200
Message-ID: <53A3E992.9000500@digi.com>
Date: Fri, 20 Jun 2014 09:58:10 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Tom King <ka6sox@gmail.com>
References: <20140619113451.GO2117@jama>	<1428623.s0yLnq7SlO@peggleto-mobl5.ger.corp.intel.com>	<CAHQecY4zy==MBoaH9GP800Xj1xg4ZYmWHbu3aemW-afv2X0uDw@mail.gmail.com>
	<3393425.cVWWd9WmCm@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <3393425.cVWWd9WmCm@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Few archives to add on sources.oe.org
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
X-List-Received-Date: Fri, 20 Jun 2014 07:58:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

On 19/06/14 19:19, Paul Eggleton wrote:
> Thanks!
>
> On Thursday 19 June 2014 10:08:58 Tom King wrote:
>> Yes,
>>
>> its in there too.

Unfortunately the cherokee binary in sources.oe.org seems corrupted:

# http://sources.openembedded.org/cherokee-1.2.98.tar.gz

$ ls -o cherokee-1.2.98.tar.gz
4096000 Jun 19 19:07 cherokee-1.2.98.tar.gz

The correct binary has *6163984* bytes.

$ md5sum cherokee-1.2.98.tar.gz
1e5aa3aecf462016548672c97f24fc34  cherokee-1.2.98.tar.gz

The MD5SUM expected by bitbake is 21b01e7d45c0e82ecc0c4257a9c27feb

You can download a good one from:

http://ftp.nluug.nl/internet/cherokee/1.2/1.2.98/cherokee-1.2.98.tar.gz

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

