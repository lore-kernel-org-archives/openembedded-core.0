Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.51])
 by mx.groups.io with SMTP id smtpd.web10.33163.1606129258720290054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 03:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LM6NJjiF;
 spf=pass (domain: windriver.com, ip: 40.107.220.51, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WglHBLcc5l9vD+ivaGm1uCO7goPZR2kMvyJEmZewVQsGfDors4RAaI3IHs5lI/U/ACtL8cIu0fgL1nt79qwPFlXPDz+cSmTWn0XNW0tZ01SlfuGjw3bEVEhHEYT32uFfBf2NcZzXImRfgjrA86YHryGz8YbfMQwBEev5TYmocVC/AVVNh4kYLOxi5hZ3V5qJR0Q4H2NlwfPc0PcDJ7RVHMih2OB0hjSoMK3VNyPpb8uZymJ/otNKAy7Gz6ay1qbCgdKbQSb6v+JUG95U3nfZRiBc40Wwgj24mdZR/flEPOmiR6xwltz7lbL60luTn1UY7pz9mNihxn8y+JVk3FPuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuteAyr0XmhXeGGUudl0JpdvWbyTCggP63FYTKRyEtA=;
 b=iclIYGeTIr7En+rlivMvzyrsK1NRU0YsFP3dmxl+GKV++KQWu+07o44IjN7qsiamFw51Q4cS3qqUrL6oGMPiUNxrkZ56q2f6XZv5Qlk+b//NMsQiG5Bq0JkE7saRcJ3r41aqz9qGX1qmO+bjRTHxVjcLsP3ef7bkqPeZNSlTCQjQGVQt3W8QF3271Fn2lzFvHbO6yyORaCFo5NbM+aSo2F/RmGrAXq08UHDg9VHnuog2ab3u+wAVnJxIU5pWN/Lr2FRCAsp+d3QwJ/km+x8QK8cOKaNAClv1FQceaCnOaxkd3UPV3OJhhYpYceIuZh7hQG8tvdHxmiHItykWQ4dc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuteAyr0XmhXeGGUudl0JpdvWbyTCggP63FYTKRyEtA=;
 b=LM6NJjiFOrRwaVmDmrf3mtNYpvX1sw7gjBqO4WOUCPvnKxE9C9xloHo7q1ps61z8CXYD0TOnV+ci8vfWRiS+lNbzJS3qGQX1YWOQq6rlZ4zG+cnVVSmve6msafE5BQloiANXumBDTXTsdzOuY8vP6/DTQ0Wov7fCPFWXCd0K83Q=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Mon, 23 Nov
 2020 11:00:56 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3589.025; Mon, 23 Nov 2020
 11:00:56 +0000
Subject: Re: [OE-core] [PATCH 1/2] systemd-systemctl: capable to call without argument
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <20201102021757.32532-1-kai.kang@windriver.com>
 <16438F587D21D644.10137@lists.openembedded.org>
 <aec8898c-4fca-9336-d947-54db4d08bad3@windriver.com>
Message-ID: <d7e4581f-80db-fecf-e17f-c460ad5d561d@windriver.com>
Date: Mon, 23 Nov 2020 18:59:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <aec8898c-4fca-9336-d947-54db4d08bad3@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0076.apcprd04.prod.outlook.com
 (2603:1096:202:15::20) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 11:00:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f130aca-2f51-462b-857a-08d88f9f0d4a
X-MS-TrafficTypeDiagnostic: SA2PR11MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5113B2EC8F151515A2FBC1B095FC0@SA2PR11MB5113.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wpe7kS1Vk/+OPvVE6WDQhT8vrvLNbH8m1jabSvd5MP8aww4epTu21YRx56p7Q3Yp8mEgZkYkh3QTXGoS0HlgCLMHnxrQXd0TrHUJmzWuYJTJNaOZCZJvP/p5bD8ndFCrE893rYohVghIke4WIMc3HF7Qc5/e5Gxp2SfgyqGyjQO1BnSTPqtV4DDpYANNyBXgbE/7ga8Z/ejEoFy87OmLmuAhczaqD4jTVZFDvceMKknGlkYirM+alQT0SeYRubWGk8//6afJCgll1zjn7PVI7H0HE/MgxfNpatvgx7EuU/OuBmBKdGV1kdf7z5Nt+xQoyIX06NMSQsRt3/WucAD3w4r026TPwHG3jyWJJ7XwkTs3auNT3ZlpKRKdeaGQ5l6T9u3Wv+wAv8srqsr0QQm+zWMHOd9Fibd8B7J+3DZvKcvlBzxeF0qBJ4UejuzS/1Mey1s/ZAMel/mPzBvt4JNg99Br++2FIknN0iSi3WKmd4Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39850400004)(36756003)(16576012)(6706004)(186003)(52116002)(86362001)(316002)(6486002)(6916009)(2906002)(33964004)(5660300002)(66946007)(16526019)(83380400001)(53546011)(26005)(956004)(2616005)(8936002)(31686004)(166002)(66476007)(966005)(66556008)(8676002)(31696002)(478600001)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xJVut+rsqblXganbhl2rRu5sT2DAzLWx3OxIyU8RtVLqZ4Po1JXUzv91G8Vq5S0oZcd31S4Xe9NDC/6/muFWmVK3QzrpxOSUTA/LY669ajCHLCBSWnx5qN0oIEqzVf1dX7Y3Lm1HL31iyPF5roMiFNLJSn4dunYMaGDf5CF3HaB/F+Hc2NPMxQsTVBAG3b6VHGvWfxXQ4OMIC1KtCy72AOcvuCRXxgD1mUo86OQUPaJx+Qudxs4wvjUJutL6Qlnlq0tJlvedCvx1M7+dt0JiQOmekD8ZaM1QSFHvEWNaLp5dfUUq82Xa5dIQHyup8utq7b6gxuQichS+VhWqkpyGW89RGwvQDcYn926mNAPYYaLMYsGMH2MSzymJY9uM7isES3Ex0dHZLoXBIAVlAiRj21Gz+6pgX6haeCdpwgBu6hMAmABhyPz5xWJTfzKpx552q/vWzlu+4sHWhdPq4HtVtsfoZqwBC1PTN/Fm8oEtET2T4RYx3kzeTlNPWEUA3iolUmhgmlDtZpdNnjQIEW7TPkvgHvBM8uqDU3Vyqu7g1IdIuK1bF00sVZWW+YQfrPKdt4gHx4lrON17/y47/oHVZ4wbUfRQ/9faFzrKNmmfVrKTV6XGSv6GUTqrYJXLJWVyvPjaN4bYp4YV/L6Cg3zopg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f130aca-2f51-462b-857a-08d88f9f0d4a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 11:00:56.2752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lluF7Tux0ieHAOSgFCRwNK4NC2fpaltW9Kt++MQjnsgR6ehH44x1+Caz97kr57tvzls1/P+wMe2H2CsQZAc5dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
Content-Type: multipart/alternative;
 boundary="------------71EB65E5CF1B554156B776D7"
Content-Language: en-US

--------------71EB65E5CF1B554156B776D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/20 10:14 AM, Kai wrote:
> Ping.

Ping...


>
> On 11/2/20 10:17 AM, kai wrote:
>> From: Kai Kang<kai.kang@windriver.com>
>>
>> Make systemctl prints help mesages if run without any argument. It helps
>> to judge whether systemctl works in postscripts in systemd.bbclass.
>>
>> Remove trailing white spaces as well.
>>
>> Signed-off-by: Kai Kang<kai.kang@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd-systemctl/systemctl | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
>> index 990de1ab39..c692b65920 100755
>> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
>> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
>> @@ -30,7 +30,7 @@ class SystemdFile():
>>           self._parse(root, path)
>>           dirname = os.path.basename(path.name) + ".d"
>>           for location in locations:
>> -            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):
>> +            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):
>>                   self._parse(root, path2)
>>   
>>       def _parse(self, root, path):
>> @@ -282,7 +282,7 @@ def main():
>>           sys.exit("Python 3.4 or greater is required")
>>   
>>       parser = argparse.ArgumentParser()
>> -    parser.add_argument('command', nargs=1, choices=['enable', 'mask',
>> +    parser.add_argument('command', nargs='?', choices=['enable', 'mask',
>>                                                        'preset-all'])
>>       parser.add_argument('service', nargs=argparse.REMAINDER)
>>       parser.add_argument('--root')
>> @@ -300,7 +300,11 @@ def main():
>>           locations.append(BASE_LIBDIR / "systemd")
>>       locations.append(LIBDIR / "systemd")
>>   
>> -    command = args.command[0]
>> +    command = args.command
>> +    if not command:
>> +        parser.print_help()
>> +        return 0
>> +
>>       if command == "mask":
>>           for service in args.service:
>>               SystemdUnit(root, service).mask()
>>
>> 
>>
>


--------------71EB65E5CF1B554156B776D7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/17/20 10:14 AM, Kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aec8898c-4fca-9336-d947-54db4d08bad3@windriver.com">
      
      <div class="moz-cite-prefix">Ping.<br>
      </div>
    </blockquote>
    <p>Ping...</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:aec8898c-4fca-9336-d947-54db4d08bad3@windriver.com">
      <div class="moz-cite-prefix"> </div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">On 11/2/20 10:17 AM, kai wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:16438F587D21D644.10137@lists.openembedded.org">
        <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com" moz-do-not-send="true">&lt;kai.kang@windriver.com&gt;</a>

Make systemctl prints help mesages if run without any argument. It helps
to judge whether systemctl works in postscripts in systemd.bbclass.

Remove trailing white spaces as well.

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com" moz-do-not-send="true">&lt;kai.kang@windriver.com&gt;</a>
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
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------71EB65E5CF1B554156B776D7--
