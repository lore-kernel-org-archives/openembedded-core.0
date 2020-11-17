Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.81])
 by mx.groups.io with SMTP id smtpd.web08.2438.1605579318475631551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 18:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gOHAW31Z;
 spf=pass (domain: windriver.com, ip: 40.107.236.81, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/0OpERrgtdpa9Efg9VYKxmuip1F6JEVeRHXBiIDgCUgVZaraPSdwSjVqDnZfkgjo6TUEgaYTSUpSRRRR8G/9ofvm7DIexTk+xY61CRxjIJBdevzDjFkeK787h6HD+VstuEI1E4srNMzidgxoo6h6FDfVtFrn0a78Gya5lvtMO99ytjjT2WTjd39Zh+Zf0mjy+3yXj14+F//qx2NjqS0iL3bYhy+s3/p+3lUfWrucEovm1b+Y+4dmfNNg5vxZPWnxGdFVYWGzNQUIm7m+balyLGrcv2bTs5rXOL5a47+qQyfwD9exVaJ4d34YHm2XCAnVOVuYBJhvdXJlIngyEcg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mxEPvlRnUAcuZF2x9an6YiAVE9ruqy4ZWP8ct7QMs4=;
 b=Vjd6oL/yV+inR1OgXWkBCqOSkPW6pPncXYpvIvz8xEKRlZEvUm+80wtZrhn1MCgWFtnrXA67j8YyKktlGT59iai2TPKsaViGQLr3fPQmfQz8+l0brvUyb+PwzAg3SWXDsefLsBdfpsiIBa6yKHeO+QUUUpW5jrdnnUIrc8h6eacFk0mjbOTXTXSJhB3DDvx/DQPJOiXaEe2VoPGp3YHed26Jwz66Q8TEjmdxQ/dgUntEASRBIXVftgA0FnR8T8rjOtK6jq8lASA+iH8s6KBFEF1j7CVfyWHaJygjOYp9PcyJEndYuf32Ah/4vW8/iCwYk1oaZeqTUTf9vL3C31KMKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mxEPvlRnUAcuZF2x9an6YiAVE9ruqy4ZWP8ct7QMs4=;
 b=gOHAW31ZMUZjM2GIGbuaMVuhtPWZt1CgvZ6WLSuoMp/IVVd9KoU4JGJG2yLQONmdQTLLr2EM5DMlxfGVRrJxL4nrjX8rvXIvVUziIHlMPE68QBBpLkC72jFsegtuAraWZxnlqjNtICb/33Qt31zvdvs+0uOIBxymQUSBdMjNpXs=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB2638.namprd11.prod.outlook.com (2603:10b6:805:58::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Tue, 17 Nov
 2020 02:15:16 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 02:15:16 +0000
Subject: Re: [OE-core] [PATCH 1/2] systemd-systemctl: capable to call without argument
From: "kai" <kai.kang@windriver.com>
To: obi@opendreambox.org
Cc: openembedded-core@lists.openembedded.org
References: <20201102021757.32532-1-kai.kang@windriver.com>
 <16438F587D21D644.10137@lists.openembedded.org>
Message-ID: <aec8898c-4fca-9336-d947-54db4d08bad3@windriver.com>
Date: Tue, 17 Nov 2020 10:14:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16438F587D21D644.10137@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:203:b0::33) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK0PR03CA0117.apcprd03.prod.outlook.com (2603:1096:203:b0::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend Transport; Tue, 17 Nov 2020 02:15:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79edf9b8-171f-46ce-4feb-08d88a9e9f55
X-MS-TrafficTypeDiagnostic: SN6PR11MB2638:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2638154CA0F5E675415EEFAF95E20@SN6PR11MB2638.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/Uawk/1y0k9xT+JtqNE9dfqfqlb4/RVWyld6J8fbpd6eWwau0fPiKp8zeYCOvRFB4SCsAFUWEPwWT+uYGCvRzwB2IUPNlCAbo+w5Rat+B2rdA5fPYLrqRHrlP3j9GmaXC/PEF+P9x2xi9MbiZB8mT0NFfd27RtJ0uhkLszU5GyDIpUjSDqHHZX5ENL9JPpMw3QXZVhY9JTZiCNzXxQfYpOGTmZHyTRGfKWOqClGu+YTJrS+COGwzWhrzCDVTDA5I9p9CNkhkoGNE8AdH1a3H2xMrWkgYIxVFvT2hqVgwj9hz8WPfclbHfLrO10kMKSYW15KWaCnj34Fnbzbx59rKHJadzm2CJ8OF4Epc5HmJQsX5gOW7W1H4c3q2Yd/amxY7wbngHgeynPKLgrD1cmDMX6lH5rTv93+P7s1BzOe3r0Z8TnHGtHHTS1AW2M5SdOJooSLU8UGtqghSbeukK3oO62vVlluWaLpVubd+werL0Mg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39850400004)(346002)(376002)(31696002)(86362001)(316002)(16576012)(4326008)(2906002)(2616005)(956004)(66556008)(8936002)(6486002)(66946007)(8676002)(66476007)(6916009)(6706004)(36756003)(166002)(33964004)(186003)(478600001)(26005)(83380400001)(966005)(5660300002)(6666004)(16526019)(31686004)(52116002)(53546011)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bk8K8Fm5Imy3huVVOqf/a9fegqDeudYAZ05heJkBQVUX+5flSyhUXTrRvw5vuws6uuv+q0dDpfgv+ctawTplXS4HQ3qzs6UDkmW6goqXaUmEHzsG8Ge5A65c4kLYQ2I3wIudjzVSuIc5UP3r80IwOHdKd2+zo+/PjRL2ulLEAbHiJCZR4YcNjCGghFaCmqV4sGCWzkViDX0H183p7qmF6eoRROcexXqempwu8lUH2psMZ6rrPB1yQ4hhETu3vjluwDP1YvAOzoD/DYadU/WuXJw56PDk5KHSEz65GWAcYOTV1f/k5l4KOZ1twtR+GZ6dBaWYIxYye5ZkZW+ne/OxhtMmo+G+QhgWyk7Cq+olwgG2QwqJEOIy1/dXAhFPQyhdSqHTe1ATohpthi4bmA/SHfA7CJQ9r88K5ltux584Ng2sBScK0qzPLVs7z8PqqqIXKytiBZSxZdNsfB5vk2e+/rihlXfbgBEhzEgUqQLoq0Jbaq8mQoYX8EI2p+ApjWRZonFnQRcFl3N9EqMGgXRhVTLBxNwDhZE/s7K1tJz/ZRyBRR0KGU7wMPNQdqwJsLhxgK9yCLEZQ+zxC3Ztoqz6jKTQDmTf5pc1Hm19MyOXf7/fhTSEos8ZuSj9K0Myn4ykNa6gyjPeyWZx53kUb5dLeQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79edf9b8-171f-46ce-4feb-08d88a9e9f55
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 02:15:15.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVjftNOaX1HB+3BACVBmn1KhHD5Q6tphXjzst6x1d4vxQmD0Y9ex07KsyZRQyZccnKIbN4EbCc8YT42fLVKFTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2638
Content-Type: multipart/alternative;
 boundary="------------BF4AE5B2FA0774820068E8AB"
Content-Language: en-US

--------------BF4AE5B2FA0774820068E8AB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ping.

On 11/2/20 10:17 AM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Make systemctl prints help mesages if run without any argument. It helps
> to judge whether systemctl works in postscripts in systemd.bbclass.
>
> Remove trailing white spaces as well.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd-systemctl/systemctl | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> index 990de1ab39..c692b65920 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -30,7 +30,7 @@ class SystemdFile():
>           self._parse(root, path)
>           dirname = os.path.basename(path.name) + ".d"
>           for location in locations:
> -            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):
> +            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):
>                   self._parse(root, path2)
>   
>       def _parse(self, root, path):
> @@ -282,7 +282,7 @@ def main():
>           sys.exit("Python 3.4 or greater is required")
>   
>       parser = argparse.ArgumentParser()
> -    parser.add_argument('command', nargs=1, choices=['enable', 'mask',
> +    parser.add_argument('command', nargs='?', choices=['enable', 'mask',
>                                                        'preset-all'])
>       parser.add_argument('service', nargs=argparse.REMAINDER)
>       parser.add_argument('--root')
> @@ -300,7 +300,11 @@ def main():
>           locations.append(BASE_LIBDIR / "systemd")
>       locations.append(LIBDIR / "systemd")
>   
> -    command = args.command[0]
> +    command = args.command
> +    if not command:
> +        parser.print_help()
> +        return 0
> +
>       if command == "mask":
>           for service in args.service:
>               SystemdUnit(root, service).mask()
>
> 
>


--------------BF4AE5B2FA0774820068E8AB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Ping.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 11/2/20 10:17 AM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16438F587D21D644.10137@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Make systemctl prints help mesages if run without any argument. It helps
to judge whether systemctl works in postscripts in systemd.bbclass.

Remove trailing white spaces as well.

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 990de1ab39..c692b65920 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -30,7 +30,7 @@ class SystemdFile():
         self._parse(root, path)
         dirname = os.path.basename(path.name) + &quot;.d&quot;
         for location in locations:
-            for path2 in sorted((root / location / &quot;system&quot; / dirname).glob(&quot;*.conf&quot;)):                
+            for path2 in sorted((root / location / &quot;system&quot; / dirname).glob(&quot;*.conf&quot;)):
                 self._parse(root, path2)
 
     def _parse(self, root, path):
@@ -282,7 +282,7 @@ def main():
         sys.exit(&quot;Python 3.4 or greater is required&quot;)
 
     parser = argparse.ArgumentParser()
-    parser.add_argument('command', nargs=1, choices=['enable', 'mask',
+    parser.add_argument('command', nargs='?', choices=['enable', 'mask',
                                                      'preset-all'])
     parser.add_argument('service', nargs=argparse.REMAINDER)
     parser.add_argument('--root')
@@ -300,7 +300,11 @@ def main():
         locations.append(BASE_LIBDIR / &quot;systemd&quot;)
     locations.append(LIBDIR / &quot;systemd&quot;)
 
-    command = args.command[0]
+    command = args.command
+    if not command:
+        parser.print_help()
+        return 0
+
     if command == &quot;mask&quot;:
         for service in args.service:
             SystemdUnit(root, service).mask()
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------BF4AE5B2FA0774820068E8AB--
